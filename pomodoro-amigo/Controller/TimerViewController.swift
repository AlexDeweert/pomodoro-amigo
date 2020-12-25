//
//  TimerViewController.swift
//  pomodoro-amigo
//
//  Created by Alex L. Deweert on 2020-12-24.
//

import Foundation
import UIKit

class TimerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = TimerView()
    }
}

extension TimerViewController: TimerViewControllerDelegate {
    //Default mode buttons
    @objc
    func handleStartTimerPressed() {
        print("handleStartTimerPressed")
    }
    @objc
    func handlePauseTimerPressed() {
        print("handlePauseTimerPressed")
    }
    //TODO: Make this react to a central state and change the toggle based on that
    //instead of comparing a UIImage instance.
    @objc
    func handleRepeatToggled(_ sender: UIButton) {
        print("handleRepeatToggled")
        let config = UIImage.SymbolConfiguration(pointSize: 38, weight: UIImage.SymbolWeight.bold, scale: .large)
        if sender.currentImage == UIImage(systemName: "square", withConfiguration: config) {
            let checkmarkSquare = UIImage(systemName: "checkmark.square", withConfiguration: config)
            sender.setImage(checkmarkSquare, for: .normal)
        }
        else {
            let square = UIImage(systemName: "square", withConfiguration: config)
            sender.setImage(square, for: .normal)
        }
    }
    @objc
    func handleSaveToCollectionPressed() {
        print("handleSaveToCollectionPressed")
    }
    @objc
    func handleEditPressed() {
        print("handleEditPressed")
    }
    
    //Edit mode buttons
    @objc
    func handleIntervalPromoted() {
        print("handleIntervalPromoted")
    }
    @objc
    func handleIntervalDemoted() {
        print("handleIntervalDemoted")
    }
    @objc
    func handleDeleteInterval() {
        print("handleDeleteInterval")
    }
    @objc
    func handleAddNewInterval() {
        print("handleAddNewInterval")
    }
    @objc
    func handleSaveEditsButtonPressed() {
        print("handleSaveEditsButtonPressed")
    }
    
    
}
