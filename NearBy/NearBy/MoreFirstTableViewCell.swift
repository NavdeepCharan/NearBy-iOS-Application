//
//  MoreFirstTableViewCell.swift
//  foodApp
//
//  Created by Navdeep Charan on 31/03/18.
//  Copyright © 2018 Mithra Media. All rights reserved.
//

import UIKit

class MoreFirstTableViewCell: UITableViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
var imagePicker = UIImagePickerController()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var AddImageButton: UIButton!

}
