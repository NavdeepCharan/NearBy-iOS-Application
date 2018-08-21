//
//  MyTableViewCell.swift
//  foodApp
//
//  Created by Navdeep Charan on 31/03/18.
//  Copyright © 2018 Mithra Media. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var address : UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
