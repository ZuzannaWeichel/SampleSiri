//
//  WhatsTheTimeViewControllerTests.swift
//  SampleIntentUI
//
//  Created by sheila.m.wallace on 3/20/20.
//

@testable import SampleSiri

import Quick
import Nimble
import IntentsUI

class WhatsTheTimeViewControllerTests: QuickSpec {
    override func spec() {
        var subject: WhatsTheTimeViewController!
        
        beforeEach {
            subject = WhatsTheTimeViewController()
            subject.timeLabel = UILabel()
            
            
            expect(subject).toNot(beNil())
            
            _ = subject.view
        }
        
        describe("getCurrentDateTime") {
            it("has a label") {
                let dateString = SampleTime.sharedInstance.getFormattedTime(format: SampleTime.sharedInstance.militaryFormat, date: Date())
                expect(subject.timeLabel.text).to(equal(dateString))
            }
        }
    }
}
                
