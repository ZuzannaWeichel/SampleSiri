//
//  SampleTime.swift
//  SampleSiri
//
//  Created by victor.t.stasek on 3/13/20.
//

import Foundation

class SampleTime {
    static var sharedInstance = SampleTime()
    var date : Date!
    public var militaryFormat = "MM-dd-yyyy HH:mm:ss"
    public var shortFormat = "MM/dd/yyyy h:mm a"
    
    func currentDate() -> Date {
        date = Date()
        return date
    }
    
    public func getFormattedTime(format: String, date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let currentDateTime = formatter.string(from: date)
      
        return currentDateTime
    }
}
