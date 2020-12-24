//
//  ViewController.swift
//  pomodoro-amigo
//
//  Created by Alex L. Deweert on 2020-12-23.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = LoginView()
    }
}

extension LoginViewController: LoginViewControllerDelegate {
    
    @objc
    func handleSignInWithAppleButtonClicked() {
        print("handleSignInWithAppleButtonClicked")
    }
    @objc
    func handleForgottenPasswordButtonClicked() {
        print("handleForgottenPasswordButtonClicked")
    }
    @objc
    func handleSignInWithFacebookButtonClicked() {
        print("handleSignInWithFacebookButtonClicked")
    }
    @objc
    func handleSignInWithGoogleButtonClicked() {
        print("handleSignInWithGoogleButtonClicked")
    }
    @objc
    func handleLoginSigninButtonClicked() {
        print("handleLoginSigninButtonClicked")
    }
    @objc
    func handleSkipButtonClicked() {
        print("handleSkipButtonClicked")
    }
}

