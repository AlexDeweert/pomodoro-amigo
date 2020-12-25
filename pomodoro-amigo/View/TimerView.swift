//
//  TimerView.swift
//  pomodoro-amigo
//
//  Created by Alex L. Deweert on 2020-12-24.
//

import Foundation
import UIKit

@objc
protocol TimerViewControllerDelegate {
    //Default mode buttons
    func handleStartTimerPressed()
    func handlePauseTimerPressed()
    func handleRepeatToggled(_ sender: UIButton)
    func handleSaveToCollectionPressed()
    func handleEditPressed()
    
//    //Edit mode buttons
//    func handleSaveEditsButtonPressed()
//
//    //Edit mode uicollectionview items (the interval list cells)
//    //called from a uicollectionview that will be a subview of TimerView
//    func handleIntervalPromoted()
//    func handleIntervalDemoted()
//    func handleDeleteInterval()
//    func handleAddNewInterval()
}

class TimerView: UIView {
    
    var delegate: TimerViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.didLoad()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.didLoad()
    }
    
    func didLoad() {
        self.backgroundColor = UIColor.white
        
        //Default mode setup
        let defaultModeTimerTitle = setupDefaultModeTimerTitle()
        let defaultModeIntervalCollection = setupDefaultModeIntervalCollection()
        let startTimer = setupStartTimer()
        let pauseTimer = setupPauseTimer()
        let repeatToggle = setupRepeatToggle()
        let repeatLabel = setupRepeatLabel()
        let saveToCollectionButton = setupSaveToCollectionButton()
        let editButton = setupEditButton()
        //Edit mode setup
//        let editModeTimerTitle = setupEditModeTimerTitle()
//        let saveEditsButton = setupSaveEditsButton()
        
        self.addSubview(defaultModeTimerTitle)
        self.addSubview(defaultModeIntervalCollection)
        self.addSubview(startTimer)
        self.addSubview(pauseTimer)
        self.addSubview(repeatToggle)
        self.addSubview(repeatLabel)
        self.addSubview(saveToCollectionButton)
        self.addSubview(editButton)
//        self.addSubview(editModeTimerTitle)
//        self.addSubview(saveEditsButton)
        
        setupConstraints(dmtt: defaultModeTimerTitle, dmic: defaultModeIntervalCollection, stb: startTimer, ptb: pauseTimer, rtb: repeatToggle, rl: repeatLabel, stcb: saveToCollectionButton, eb: editButton)
    }
}

extension TimerView {
    func setupDefaultModeTimerTitle() -> UILabel {
        let label = UILabel()
        label.text = "Interval Schema Name"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func setupDefaultModeIntervalCollection() -> UICollectionView {
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 150, height: 150), collectionViewLayout: UICollectionViewLayout() )
        collection.backgroundColor = UIColor.red
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }
    
    func setupStartTimer() -> UIButton {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 45, weight: UIImage.SymbolWeight.bold, scale: .large)
        let playIcon = UIImage(systemName: "play.fill", withConfiguration: config)
        button.setImage(playIcon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(delegate, action: #selector(delegate?.handleStartTimerPressed), for: .touchUpInside)
        return button
    }
    
    func setupPauseTimer() -> UIButton {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 45, weight: UIImage.SymbolWeight.bold, scale: .large)
        let pauseIcon = UIImage(systemName: "pause.fill", withConfiguration: config)
        button.setImage(pauseIcon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(delegate, action: #selector(delegate?.handlePauseTimerPressed), for: .touchUpInside)
        return button
    }
    
    //TODO:
    //The style of this button needs to change based on app state (user preferences state)
    //Alternate between checked and unchecked images based on UIControlStateNormal and Selected
    func setupRepeatToggle() -> UIButton {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 38, weight: UIImage.SymbolWeight.bold, scale: .large)
        let checkmarkSquare = UIImage(systemName: "checkmark.square", withConfiguration: config)
        button.setImage(checkmarkSquare, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(delegate, action: #selector(delegate?.handleRepeatToggled(_:)), for: .touchUpInside)
        return button
    }
    
    func setupRepeatLabel() -> UILabel {
        let label = UILabel()
        label.text = "Repeat"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func setupSaveToCollectionButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Save to collection", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 5
        button.contentEdgeInsets = UIEdgeInsets(top: 3, left: 5, bottom: 3, right: 5)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(delegate, action: #selector(delegate?.handleSaveToCollectionPressed), for: .touchUpInside)
        return button
    }
    
    func setupEditButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 5
        button.contentEdgeInsets = UIEdgeInsets(top: 3, left: 5, bottom: 3, right: 5)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(delegate, action: #selector(delegate?.handleEditPressed), for: .touchUpInside)
        return button
    }
    
//    func setupEditModeTimerTitle() -> UITextField {
//        let textField = UITextField()
//        return textField
//    }
//
//    func setupSaveEditsButton() -> UIButton {
//        let button = UIButton()
//        return button
//    }
    
    func setupConstraints(dmtt: UILabel, dmic: UICollectionView, stb: UIButton, ptb: UIButton, rtb: UIButton, rl: UILabel, stcb: UIButton, eb: UIButton) {
        print(UIScreen.main.bounds.height)
        print(UIScreen.main.bounds.height*0.15)
        NSLayoutConstraint.activate([
            //Default mode timer title
            dmtt.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dmtt.centerYAnchor.constraint(equalTo: self.topAnchor, constant: UIScreen.main.bounds.height*0.15),
            //Default mode interval collection
            dmic.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dmic.topAnchor.constraint(equalTo: dmtt.bottomAnchor, constant: 60),
            dmic.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            dmic.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height*0.35),
            //Start timer button
            stb.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -45),
            stb.topAnchor.constraint(equalTo: dmic.bottomAnchor, constant: 35),
            //Pause timer button
            ptb.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 45),
            ptb.topAnchor.constraint(equalTo: dmic.bottomAnchor, constant: 35),
            //Repeat toggle (a button that changes state from checked to unchecked)
            rtb.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -35),
            rtb.topAnchor.constraint(equalTo: ptb.bottomAnchor, constant: 35),
            //Repeat toggle label
            rl.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 25),
            rl.centerYAnchor.constraint(equalTo: rtb.centerYAnchor),
            //Save to collection button (to the list of intervals)
            stcb.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stcb.topAnchor.constraint(equalTo: rtb.bottomAnchor, constant: 26),
            stcb.widthAnchor.constraint(equalToConstant: 200),
            stcb.heightAnchor.constraint(equalToConstant: 40),
            //Edit button
            eb.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            eb.topAnchor.constraint(equalTo: stcb.bottomAnchor, constant: 8),
            eb.widthAnchor.constraint(equalToConstant: 200),
            eb.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
}
