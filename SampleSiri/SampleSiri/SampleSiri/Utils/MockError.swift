//
//  MockError.swift
//  SampleSiriTests
//
//  Created by sheila.m.wallace on 3/12/20.
//

import Foundation
enum MockError: Error {
    case error1
    case error2
}

extension MockError : LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .error1:
            return NSLocalizedString("You got the first error", comment: "")
            
        case .error2:
            return NSLocalizedString("You got the second error", comment: "")
        }
    }
    public var failureReason: String? {
        switch self {
        case .error1:
            return NSLocalizedString("Dunno why the first error happened", comment: "")
            
        case .error2:
            return NSLocalizedString("I'm baffled about the second error too", comment: "")
        }
    }
    public var recoverySuggestion: String? {
        switch self {
        case .error1:
            return NSLocalizedString("Turn it off and on again?", comment: "")
            
        case .error2:
            return NSLocalizedString("Just go home for the day", comment: "")
        }
    }
}
