//
//  PlaceDetailTableViewCell.swift
//  Nearby
//
//  Created by Navdeep Charan on 25/06/18.
//  Copyright © 2018 Mithra Media All rights reserved.
//

import UIKit
import MapKit
class PlaceDetailTableViewCell: UITableViewCell
{
    @IBOutlet var map : MKMapView!
    @IBOutlet var phone: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var photo: UIImageView!
    @IBOutlet var timing: UITextView!
    
    @IBOutlet var reviewAuthor: UILabel!
    @IBOutlet var commentText: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
