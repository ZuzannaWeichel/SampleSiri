//
//  ViewController.swift
//  SampleSiri
//
//  Created by zuzanna.weichel on 3/10/20.
//

import UIKit
import Alamofire
import IntentsUI
import SampleTime

class ViewController: UIViewController {

    @IBOutlet weak var timeAndDate: UILabel!
    @IBOutlet weak var addToSiriButton: INUIAddVoiceShortcutButton!
    
    var alertUtils = AlertUtils.sharedInstance
    var sampleTime = SampleTime.sharedInstance
    
    var isMilitaryFormat = true

    @IBAction func changeFormat(_ sender: UIButton) {
        isMilitaryFormat = !isMilitaryFormat
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addToSiriButton.shortcut = INShortcut(intent: WhatsTheTimeIntent())
        addToSiriButton.delegate = self
        
        timeAndDate.text = sampleTime.getFormattedTime(format: sampleTime.militaryFormat, date: Date())
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func fireTimer(timer: Timer) {
        if isMilitaryFormat {
            timeAndDate.text = sampleTime.getFormattedTime(format: sampleTime.militaryFormat, date: Date())
        }else{
            timeAndDate.text = sampleTime.getFormattedTime(format: sampleTime.shortFormat, date: Date())
        }
    }
    
    @IBAction func addShortcut(_ sender: Any) {
        if let shortcut = INShortcut(intent: WhatsTheTimeIntent()) {
            let shortcutViewController = INUIAddVoiceShortcutViewController(shortcut: shortcut)
            shortcutViewController.modalPresentationStyle = .formSheet
            shortcutViewController.delegate = self
            present(shortcutViewController, animated: true, completion: nil)
        }
    }
}

extension ViewController: INUIAddVoiceShortcutButtonDelegate {
    func present(_ addVoiceShortcutViewController: INUIAddVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        addVoiceShortcutViewController.delegate = self
        present(addVoiceShortcutViewController, animated: true, completion: nil)
    }
    
    func present(_ editVoiceShortcutViewController: INUIEditVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        editVoiceShortcutViewController.delegate = self
        present(editVoiceShortcutViewController, animated: true, completion: nil)
    }
}

extension ViewController: INUIAddVoiceShortcutViewControllerDelegate {
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        dismiss(animated: true, completion: nil)
        if let error = error as NSError? {
            alertUtils.showAlert(viewController: self, title: "Something went wrong", message: "Your shortcut could not be created. Please try again. \(error.localizedDescription)")
        } else {
            alertUtils.showAlert(viewController: self, title: "Success", message: "Your shortcut was added.")
        }
    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        dismiss(animated: true, completion: nil)
        alertUtils.showAlert(viewController: self, title: "Cancelled", message: "Your shortcut was not created.")
    }
}

extension ViewController: INUIEditVoiceShortcutViewControllerDelegate {
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController,
                                         didUpdate voiceShortcut: INVoiceShortcut?,
                                         error: Error?) {
        dismiss(animated: true, completion: nil)
        if let error = error as NSError? {
            alertUtils.showAlert(viewController: self, title: "Something went wrong", message: "Your shortcut could not be edited. Please try again. \(error.localizedDescription)")
        }
    }
    
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController,
                                         didDeleteVoiceShortcutWithIdentifier deletedVoiceShortcutIdentifier: UUID) {
        dismiss(animated: true, completion: nil)
        alertUtils.showAlert(viewController: self, title: "Success", message: "Your shortcut was deleted.")
    }
    
    func editVoiceShortcutViewControllerDidCancel(_ controller: INUIEditVoiceShortcutViewController) {
        dismiss(animated: true, completion: nil)
        alertUtils.showAlert(viewController: self, title: "Cancelled", message: "Your shortcut was not edited.")
    }
}
