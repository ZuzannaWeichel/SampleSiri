//
//  WhatsTheTimeIntentHandlerTests.swift
//  SampleSiriTests
//
//  Created by sheila.m.wallace on 3/20/20.


@testable import SampleIntent

import Quick
import Nimble
import IntentsUI
import Intents

class WhatsTheTimeIntentHandlerTests: QuickSpec {
    override func spec() {
        var subject: WhatsTheTimeIntentHandler!
        var mockSampleTime: MockSampleTimeObj!
        var expectedTimeValue = "March 20, 11:02 AM"

        beforeEach {
            subject = WhatsTheTimeIntentHandler()
            mockSampleTime = MockSampleTimeObj()

            expect(subject).toNot(beNil())
        }

        describe("confirm") {
            it("calls the completion handler") {
                waitUntil { done in
                    let intent = WhatsTheTimeIntent()
                    subject.confirm(intent: intent) { response in
                        expect(response).toNot(beNil())
                        expect(response).to(beAnInstanceOf(WhatsTheTimeIntentResponse.self))
                        done()
                    }
                }
            }
            
        }
        
    }
    
}
