//
//  ViewController.swift
//  reversedDataDeliverance
//
//  Created by Neestackich on 21.08.2020.
//  Copyright © 2020 Neestackich. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, FirstViewControllerDelegate {
    
    @IBOutlet weak var label: UILabel!
//    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SecondViewController else { return }
        destination.delegate = self
    }
    
    func update(text: String) {
        label.text = text
    }
}

