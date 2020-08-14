//
//  IntentHandler.swift
//  SampleIntent
//
//  Created by zuzanna.weichel on 3/11/20.
//

import Intents

// As an example, this class is set up to handle WhatsTheTime intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any {
        return WhatsTheTimeIntentHandler()
    }
}
