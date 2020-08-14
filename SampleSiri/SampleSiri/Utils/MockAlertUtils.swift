//
//  MockAlertUtils.swift
//  SampleSiriTests
//
//  Created by sheila.m.wallace on 3/12/20.
//

@testable import SampleSiri

import UIKit

class MockAlertUtils: AlertUtils {
    
    var showAlertCallCount = 0
    var alertTitle: String!
    var alertMessage: String!

    
    func initMock() {
        showAlertCallCount = 0
        alertTitle = "default alert title"
        alertMessage = "Help! I need somebody. Help! Not just anybody. Help! I need someone. Heeelp!"
    }
    
    override func showAlert(viewController: UIViewController, title: String, message: String, completion: (() -> Void)? = nil) {
        showAlertCallCount += 1
        alertTitle = title
        alertMessage = message
    }
}
