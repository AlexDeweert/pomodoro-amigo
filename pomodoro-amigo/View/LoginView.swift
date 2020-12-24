//
//  LoginView.swift
//  pomodoro-amigo
//
//  Created by Alex L. Deweert on 2020-12-23.
//

import Foundation
import UIKit
import AuthenticationServices

@objc
protocol LoginViewControllerDelegate {
    func handleSignInWithAppleButtonClicked()
    func handleSignInWithFacebookButtonClicked()
    func handleSignInWithGoogleButtonClicked()
    func handleLoginSigninButtonClicked()
    func handleForgottenPasswordButtonClicked()
    func handleSkipButtonClicked()
}

class LoginView: UIView {
    
    var delegate: LoginViewControllerDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("LoginView.init(frame:)")
        self.didLoad()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("LoginView.init(coder:)")
        self.didLoad()
    }
    
    func didLoad() {
        self.backgroundColor = .white
        
        let signInWithAppleButton = setupAppleButton()
        let signInWithFacebookButton = setupFacebookButton()
        let signInWithGoogleButton = setupGoogleButton()
        let orLabel = setupOrLabel()
        let loginSigninButton = setupLoginSignInButton()
        let emailTextField = setupEmailTextField()
        let passwordTextField = setupPasswordTextField()
        let forgotPasswordButton = setupForgottenPasswordButton()
        let skipButton = setupSkipButton()
        self.addSubview(signInWithAppleButton)
        self.addSubview(signInWithFacebookButton)
        self.addSubview(signInWithGoogleButton)
        self.addSubview(orLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginSigninButton)
        self.addSubview(forgotPasswordButton)
        self.addSubview(skipButton)
        self.setupConstraints(siwab: signInWithAppleButton, siwfb: signInWithFacebookButton, siwgb: signInWithGoogleButton, or: orLabel, etf: emailTextField, pwtf: passwordTextField, lisib: loginSigninButton, fpwb: forgotPasswordButton, skip: skipButton)
    }
    
}

extension LoginView {
    func setupAppleButton() ->  ASAuthorizationAppleIDButton {
        let button =  ASAuthorizationAppleIDButton()
        button.addTarget(delegate, action: #selector(delegate?.handleSignInWithAppleButtonClicked), for: .touchUpInside)
        button.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func setupFacebookButton() -> UIButton {
        let button = UIButton()
        button.addTarget(delegate, action: #selector(delegate?.handleSignInWithFacebookButtonClicked), for: .touchUpInside)
        button.setTitle("Sign in with Facebook", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func setupGoogleButton() -> UIButton {
        let button = UIButton()
        button.addTarget(delegate, action: #selector(delegate?.handleSignInWithGoogleButtonClicked), for: .touchUpInside)
        button.setTitle("Sign in with Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func setupEmailTextField() -> UITextField {
        let textField = UITextField()
        var placeholderAttributes = [NSAttributedString.Key : Any]()
        placeholderAttributes[.foregroundColor] = UIColor.black
        let placeholderText = NSAttributedString(string: "E-mail", attributes: placeholderAttributes)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 60))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.attributedPlaceholder = placeholderText
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    func setupPasswordTextField() -> UITextField {
        let textField = UITextField()
        var placeholderAttributes = [NSAttributedString.Key : Any]()
        placeholderAttributes[.foregroundColor] = UIColor.black
        let placeholderText = NSAttributedString(string: "Password", attributes: placeholderAttributes)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 60))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.attributedPlaceholder = placeholderText
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    func setupLoginSignInButton() -> UIButton {
        let button = UIButton()
        button.addTarget(delegate, action: #selector(delegate?.handleLoginSigninButtonClicked), for: .touchUpInside)
        button.setTitle("Log in / Sign up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func setupForgottenPasswordButton() -> UIButton {
        let button = UIButton()
        button.addTarget(delegate, action: #selector(delegate?.handleForgottenPasswordButtonClicked), for: .touchUpInside)
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func setupSkipButton() -> UIButton {
        let button = UIButton()
        button.addTarget(delegate, action: #selector(delegate?.handleSkipButtonClicked), for: .touchUpInside)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func setupOrLabel() -> UILabel {
        let label = UILabel()
        label.text = "OR"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func setupConstraints(siwab: ASAuthorizationAppleIDButton, siwfb: UIButton, siwgb: UIButton, or: UILabel, etf: UITextField, pwtf: UITextField, lisib: UIButton, fpwb: UIButton, skip: UIButton) {
        NSLayoutConstraint.activate([
            //Apple button
            siwab.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            siwab.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            siwab.widthAnchor.constraint(equalToConstant: 200),
            siwab.heightAnchor.constraint(equalToConstant: 40),
            //Facebook button
            siwfb.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            siwfb.topAnchor.constraint(equalTo: siwab.bottomAnchor, constant: 8),
            siwfb.widthAnchor.constraint(equalToConstant: 200),
            //Google button
            siwgb.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            siwgb.topAnchor.constraint(equalTo: siwfb.bottomAnchor, constant: 8),
            siwgb.widthAnchor.constraint(equalToConstant: 200),
            siwgb.heightAnchor.constraint(equalToConstant: 40),
            //OR label
            or.heightAnchor.constraint(equalToConstant: 40),
            or.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            or.topAnchor.constraint(equalTo: siwgb.bottomAnchor, constant: 8),
            //Email text field
            etf.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            etf.topAnchor.constraint(equalTo: or.bottomAnchor, constant: 8),
            etf.widthAnchor.constraint(equalToConstant: 200),
            etf.heightAnchor.constraint(equalToConstant: 40),
            //Password text field
            pwtf.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pwtf.topAnchor.constraint(equalTo: etf.bottomAnchor, constant: 8),
            pwtf.widthAnchor.constraint(equalToConstant: 200),
            pwtf.heightAnchor.constraint(equalToConstant: 40),
            //Login Signin button
            lisib.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lisib.topAnchor.constraint(equalTo: pwtf.bottomAnchor, constant: 20),
            lisib.widthAnchor.constraint(equalToConstant: 140),
            lisib.heightAnchor.constraint(equalToConstant: 40),
            //Forgot password button
            fpwb.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            fpwb.topAnchor.constraint(equalTo: lisib.bottomAnchor, constant: 30),
            fpwb.heightAnchor.constraint(equalToConstant: 20),
            //Skip button
            skip.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            skip.topAnchor.constraint(equalTo: fpwb.bottomAnchor, constant: 15),
            skip.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
