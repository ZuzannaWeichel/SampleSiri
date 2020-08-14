//
//  MockSampleTime.swift
//  SampleTimeTests
//
//  Created by victor.t.stasek on 3/16/20.
//

@testable import SampleTime

class MockSampleTime: SampleTime {
    
    var currentDateCallCount = 0
    
    override func currentDate() -> Date {
        currentDateCallCount += 1
        let date = Date(timeIntervalSinceReferenceDate: 605812393) // Mar 13, 2020, 1:13 PM
        return date
    }
}
