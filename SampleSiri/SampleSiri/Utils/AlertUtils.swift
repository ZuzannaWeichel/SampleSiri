//
//  AlertUtils.swift
//  SampleSiri
//
//  Created by sheila.m.wallace on 3/12/20.
//

import UIKit

class AlertUtils {
    static var sharedInstance = AlertUtils()
    
    func showAlert(viewController: UIViewController, title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        viewController.present(alertController, animated: true, completion: completion)
    }
}
