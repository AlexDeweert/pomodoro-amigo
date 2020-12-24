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
    @objc
    func handleRepeatToggled() {
        print("handleRepeatToggled")
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
