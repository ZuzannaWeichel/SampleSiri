//
//  SampleSiriTests.swift
//  SampleSiriTests
//
//  Created by zuzanna.weichel on 3/10/20.
//

@testable import SampleSiri

import Quick
import Nimble
import IntentsUI

class ViewControllerSpec: QuickSpec {
    override func spec() {
        var subject: ViewController!
        var mockViewController: MockViewController!
        var mockAlertUtils: MockAlertUtils!
        
        beforeEach {
            subject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as? ViewController
            expect(subject).toNot(beNil())
            
            setupMockViewController()
            setupMockAlertUtils()
            
            _ = subject.view
        }
        
        describe("viewDidLoad") {
            it("loaded elements correctly") {
                expect(subject.addToSiriButton).toNot(beNil())
                expect(subject.timeAndDate.text).toNot(beNil())
                expect(subject.changeFormat).toNot(beNil())
            }
        }
        describe("Add voice shortcut delegate"){
            it("presents the shortcut view controller") {
                 
                mockViewController.present(INUIAddVoiceShortcutViewController(), for: INUIAddVoiceShortcutButton())
                
                expect(mockViewController.presentCallCount).to(equal(1))
            }
            it("presents the edit shortcut view controller") {
                
                mockViewController.present(INUIEditVoiceShortcutViewController(), for: INUIAddVoiceShortcutButton())
                
                expect(mockViewController.presentCallCount).to(equal(1))
            }
        }
        describe("Add voice shortcut view controller delegete") {
            it("did finish"){
                mockViewController.addVoiceShortcutViewController(INUIAddVoiceShortcutViewController(), didFinishWith: nil, error: nil)
                
                expect(mockViewController.dismissCallCount).to(equal(1))
            }
            
            it("shows failure alert") {
                mockViewController.addVoiceShortcutViewController(INUIAddVoiceShortcutViewController(), didFinishWith: nil, error: MockError.error1)
                
                expect(mockAlertUtils.showAlertCallCount).to(equal(1))
                expect(mockAlertUtils.alertTitle).to(equal("Something went wrong"))
                expect(mockAlertUtils.alertMessage).to(equal("Your shortcut could not be created. Please try again. You got the first error"))
            }
            
            it("shows success alert") {
                mockViewController.addVoiceShortcutViewController(INUIAddVoiceShortcutViewController(), didFinishWith: nil, error: nil)
                
                expect(mockAlertUtils.showAlertCallCount).to(equal(1))
                expect(mockAlertUtils.alertTitle).to(equal("Success"))
                expect(mockAlertUtils.alertMessage).to(equal("Your shortcut was added."))
            }
            
            it("showas cancelled alert") {
                mockViewController.addVoiceShortcutViewControllerDidCancel(INUIAddVoiceShortcutViewController())
                
                expect(mockAlertUtils.showAlertCallCount).to(equal(1))
                expect(mockAlertUtils.alertTitle).to(equal("Cancelled"))
                expect(mockAlertUtils.alertMessage).to(equal("Your shortcut was not created."))
            }
        }
        
        describe("Edit voice shortcut view controller delegete") {
            it("did update") {
                mockViewController.editVoiceShortcutViewController(INUIEditVoiceShortcutViewController(), didUpdate: nil, error: nil)
                
                expect(mockAlertUtils.showAlertCallCount).to(equal(0))
            }
            
            it("did update with error") {
                mockViewController.editVoiceShortcutViewController(INUIEditVoiceShortcutViewController(), didUpdate: nil, error: MockError.error2)
                
                expect(mockAlertUtils.showAlertCallCount).to(equal(1))
                expect(mockAlertUtils.alertTitle).to(equal("Something went wrong"))
                expect(mockAlertUtils.alertMessage).to(equal("Your shortcut could not be edited. Please try again. You got the second error"))
            }
            
            it("did delete with alert") {
                mockViewController.editVoiceShortcutViewController(INUIEditVoiceShortcutViewController(), didDeleteVoiceShortcutWithIdentifier: UUID())
                
                expect(mockViewController.dismissCallCount).to(equal(1))
                expect(mockAlertUtils.showAlertCallCount).to(equal(1))
                expect(mockAlertUtils.alertTitle).to(equal("Success"))
                expect(mockAlertUtils.alertMessage).to(equal("Your shortcut was deleted."))
            }
            
            it("cancelled editing shortcut") {
                mockViewController.editVoiceShortcutViewControllerDidCancel(INUIEditVoiceShortcutViewController())
                
                expect(mockViewController.dismissCallCount).to(equal(1))
                expect(mockAlertUtils.showAlertCallCount).to(equal(1))
                expect(mockAlertUtils.alertTitle).to(equal("Cancelled"))
                expect(mockAlertUtils.alertMessage).to(equal("Your shortcut was not edited."))
            }
        }
        
        func setupMockViewController() {
            mockViewController = MockViewController()
            mockViewController.initMock()
        }
        
        func setupMockAlertUtils() {
            mockAlertUtils = MockAlertUtils()
            mockAlertUtils.initMock()
            mockViewController.alertUtils = mockAlertUtils
        }
    }
}
