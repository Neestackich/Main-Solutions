//
//  ViewController.swift
//  SegueDataDeliverance
//
//  Created by Neestackich on 21.08.2020.
//  Copyright © 2020 Neestackich. All rights reserved.
//

import UIKit

class FirstViewControllerr: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showSecond" else {
            print("false")
            return
        }
        guard let destination = segue.destination as? SecondViewController else {
            return
        }
        destination.name = "Andrey"
    }
    
    @IBAction func pushData(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = storyboard.instantiateViewController(identifier: "SecondVC") as? SecondViewController else { return }
        secondVC.name = "Ivan"
        
        show(secondVC, sender: nil)
    }
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
    }
}

