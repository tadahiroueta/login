//
//  Tracker.swift
//  login
//
//  Created by Ueta, Lucas T on 1/26/24.
//

import UIKit

class TrackerPage: UIViewController {
    let segmented = UISegmentedControl(), stepper = UIStepper(), progressLabel = UILabel(), progressBar = UIProgressView()
    var inputLabel: UILabel?, account: [String: Any?]?
    
    var hoursCompleted = 0 {
        didSet {
            updateLabel()
            updateProgress()
    }}
    
    var hourGoal = 10 {
        didSet {
            updateLabel()
            updateProgress()
    }}

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        print(hoursCompleted)
        
        let (content, top, bottom) = addStructure(to: view)
        content.spacing = 90
        top.alignment = .center
        bottom.alignment = .center
        bottom.spacing = 20
        
        let comment = UILabel()
        comment.text = "Let's get those volunteer hours!"
        top.addArrangedSubview(comment)
        
        stepper.minimumValue = 0
        stepper.maximumValue = 1_000
        stepper.stepValue = 1
        stepper.value = 0
        stepper.addTarget(self, action: #selector(updateHours(_:)), for: .valueChanged)
        
        inputLabel = addInput("Hours completed: 0", to: top, with: stepper)
        
        progressLabel.text = "0/10 0%"
        bottom.addArrangedSubview(progressLabel)
        
        bottom.addArrangedSubview(progressBar)
        progressBar.widthAnchor.constraint(equalTo: bottom.widthAnchor, constant: -20).isActive = true
        
        segmented.insertSegment(withTitle: "Update Progress", at: 0, animated: true)
        segmented.insertSegment(withTitle: "Update Goal", at: 1, animated: true)
        segmented.selectedSegmentIndex = 0
        segmented.addTarget(self, action: #selector(handleSegment), for: .valueChanged)
        bottom.addArrangedSubview(segmented)
        
        account = (UserDefaults.standard.value(forKey: UserDefaults.standard.string(forKey: "current")!) as! [String: Any?])
        let goal = account!["goal"]! as! Int
        hoursCompleted = account!["progress"]! as! Int
        hourGoal = goal
        handleSegment()
    }
    
    @objc func updateHours(_ sender: UIStepper) {
        let value = Int(sender.value)
        if segmented.selectedSegmentIndex == 0 { hoursCompleted = value }
        else { hourGoal = value }
    }
    
    @objc func updateLabel() {
        guard inputLabel != nil else { return }
        inputLabel!.text = segmented.selectedSegmentIndex == 0 ? "Hours completed: \(hoursCompleted)" : "Hour goal: \(hourGoal)"
    }
    
    @objc func handleSegment() {
        stepper.value = Double(segmented.selectedSegmentIndex == 0 ? hoursCompleted : hourGoal)
        updateLabel()
    }
    
    func updateProgress() {
        let progress = Double(hoursCompleted) / Double(hourGoal)
        progressLabel.text = "\(hoursCompleted)/\(hourGoal) \(Int(progress * 100))%"
        progressBar.setProgress(Float(progress), animated: true)
        account!["progress"] = hoursCompleted
        account!["goal"] = hourGoal
        UserDefaults.standard.setValue(account!, forKey: account!["username"]! as! String)
    }
}

