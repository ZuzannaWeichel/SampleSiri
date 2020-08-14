//
//  IntentViewController.swift
//  SampleIntentUI
//
//  Created by victor.stasek on 3/19/20.
//

import IntentsUI
import SampleTime

public class WhatsTheTimeViewController: UIViewController {
    
    @IBOutlet public var timeLabel: UILabel!
    
    var sampleTime = SampleTime.sharedInstance
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timeLabel.text = sampleTime.getFormattedTime(format: sampleTime.militaryFormat, date: Date())
    }
}
