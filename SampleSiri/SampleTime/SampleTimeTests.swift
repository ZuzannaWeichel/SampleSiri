//
//  SampleTimeTests.swift
//  SampleSiri
//
//  Created by victor.t.stasek on 3/13/20.
//

@testable import SampleTime

import Quick
import Nimble
import IntentsUI

class SampleTimeSpec: QuickSpec {
    override func spec() {
        var subject: SampleTime!
        var mockSampleTime: MockSampleTime!
        var date: Date!
        
        beforeEach {
            subject = SampleTime()
            mockSampleTime = MockSampleTime()
            date = mockSampleTime.currentDate()
            
            expect(subject).toNot(beNil())
        }
        
        describe("getCurrentDateTime") {
            it("returns military date") {
                
                let actual = subject.getFormattedTime(format: "MM-dd-yyyy HH:mm:ss", date: date)
                
                expect(mockSampleTime.currentDateCallCount).to(equal(1))
                expect(actual).to(equal("03-13-2020 13:13:13"))
            }
            
            it("returns short date") {
                
                let actual = subject.getFormattedTime(format: "MM/dd/yyyy h:mm a", date: date)
                
                expect(mockSampleTime.currentDateCallCount).to(equal(1))
                expect(actual).to(equal("03/13/2020 1:13 PM"))
            }
            
        }
    }
}
