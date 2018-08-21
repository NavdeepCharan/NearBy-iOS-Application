//
//  MoreSecondTableViewCell.swift
//  foodApp
//
//  Created by Navdeep Charan on 31/03/18.
//  Copyright © 2018 Mithra Media. All rights reserved.
//

import UIKit

class MoreSecondTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var notes: UIButton!
    @IBOutlet weak var alarm: UIButton!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
