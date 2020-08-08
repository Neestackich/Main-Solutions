//
//  ViewController.swift
//  ButtonMovement
//
//  Created by Neestackich on 07.08.2020.
//  Copyright © 2020 Neestackich. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    // MARK: properties
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var text: UITextField!
    
    
    // MARK: methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        text.keyboardType = .emailAddress
        button.layer.cornerRadius = 5
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let screenHeightWithKeyboard = UIScreen.main.bounds.height - keyboardSize.height - 20
            
            if screenHeightWithKeyboard <= button.center.y {
                button.center.y -= button.center.y - screenHeightWithKeyboard
            }
        }
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
