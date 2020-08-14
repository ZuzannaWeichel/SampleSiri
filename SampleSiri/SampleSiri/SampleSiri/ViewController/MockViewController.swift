//
//  MockViewController.swift
//  SampleSiri
//
//  Created by sheila.m.wallace on 3/12/20.
//
@testable import SampleSiri

import UIKit

class MockViewController: ViewController {
    
    var presentCallCount = 0
    var dismissCallCount = 0
    
    func initMock() {
        presentCallCount = 0
        dismissCallCount = 0
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentCallCount += 1
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        dismissCallCount += 1
    }
    
}
