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
    func handleRepeatToggled()
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
        self.addSubview(saveToCollectionButton)
        self.addSubview(editButton)
//        self.addSubview(editModeTimerTitle)
//        self.addSubview(saveEditsButton)
        
        setupConstraints(dmtt: defaultModeTimerTitle, dmic: defaultModeIntervalCollection, stb: startTimer, ptb: pauseTimer, rtb: repeatToggle, stcb: saveToCollectionButton, eb: editButton)
    }
}

extension TimerView {
    func setupDefaultModeTimerTitle() -> UILabel {
        let label = UILabel()
        label.text = "Interval Schema Name"
        label.textColor = UIColor.black
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
        button.setTitle("Start", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func setupPauseTimer() -> UIButton {
        let button = UIButton()
        button.setTitle("Pause", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func setupRepeatToggle() -> UIButton {
        //Alternate between checked and unchecked images based on UIControlStateNormal and Selected
        let button = UIButton()
        button.setTitle("Repeat?", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func setupSaveToCollectionButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Save to collection", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func setupEditButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
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
    
    func setupConstraints(dmtt: UILabel, dmic: UICollectionView, stb: UIButton, ptb: UIButton, rtb: UIButton, stcb: UIButton, eb: UIButton) {
        
        NSLayoutConstraint.activate([
            dmtt.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dmtt.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            dmic.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dmic.centerYAnchor.constraint(equalTo: dmtt.bottomAnchor, constant: 60),
            dmic.widthAnchor.constraint(equalToConstant: 150),
            dmic.heightAnchor.constraint(equalToConstant: 150),
            stb.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -50),
            stb.centerYAnchor.constraint(equalTo: dmic.bottomAnchor, constant: 100),
            ptb.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 50),
            ptb.centerYAnchor.constraint(equalTo: dmic.bottomAnchor, constant: 100),
            rtb.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            rtb.centerYAnchor.constraint(equalTo: ptb.bottomAnchor, constant: 8),
            stcb.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stcb.centerYAnchor.constraint(equalTo: rtb.bottomAnchor, constant: 8),
            eb.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            eb.centerYAnchor.constraint(equalTo: stcb.bottomAnchor, constant: 8),
        ])
        
    }
}
