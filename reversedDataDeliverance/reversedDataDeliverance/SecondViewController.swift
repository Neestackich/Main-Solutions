//
//  SecondViewController.swift
//  reversedDataDeliverance
//
//  Created by Neestackich on 21.08.2020.
//  Copyright © 2020 Neestackich. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    // MARK: Properties
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    weak var delegate: FirstViewControllerDelegate!
    
    var text: String = "Nothing"
    
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonClick(_ sender: Any) {
        delegate?.update(text: "Text was updated")
    }
}
