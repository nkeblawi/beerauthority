//
//  BeerTableViewCell.swift
//  BeerApp_beta
//
//  Created by Nabeel Keblawi on 11/26/15.
//  Copyright © 2015 Nabeel Keblawi. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var beerTableViewImage: UIImageView!
    @IBOutlet weak var beerTableViewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
