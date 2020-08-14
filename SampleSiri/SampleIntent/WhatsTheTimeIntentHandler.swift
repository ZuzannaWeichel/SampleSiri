//
//  WhatsTheTimeIntentHandler.swift
//  SampleIntent
//
//  Created by victor.t.stasek on 3/18/20.
//

import UIKit
import Intents

public class WhatsTheTimeIntentHandler: NSObject, WhatsTheTimeIntentHandling {
    
    var sampleTime: SampleTime = SampleTime.sharedInstance
    
    public func confirm(intent: WhatsTheTimeIntent, completion: @escaping (WhatsTheTimeIntentResponse) -> Void) {
        completion(WhatsTheTimeIntentResponse(code: WhatsTheTimeIntentResponseCode.ready,
                                              userActivity: nil))
    }
    
    public func handle(intent: WhatsTheTimeIntent, completion: @escaping (WhatsTheTimeIntentResponse) -> Void) {
        let time = sampleTime.getFormattedTime(format: "MMMM d, h:mm a", date: Date())
        
        completion(WhatsTheTimeIntentResponse.success(time: time))
    }
}
