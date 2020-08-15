//
//  CustomCell.swift
//  CustomTableView
//
//  Created by Neestackich on 15.08.2020.
//  Copyright © 2020 Neestackich. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var countryCode: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cellView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
