//
//  RSPlaceTableViewCell.swift
//  getupside-places-test
//
//  Created by Roman Sakhnevych on 09.11.2020.
//

import UIKit

class RSPlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func prepareForReuse() {
        nameLabel.text = nil
        addressLabel.text = nil
    }
}
