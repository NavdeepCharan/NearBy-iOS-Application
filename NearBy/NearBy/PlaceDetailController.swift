//
//  PlaceDetailController.swift
//  Nearby
//
//  Created by Navdeep Charan on 25/06/18.
//  Copyright © 2018 Mithra Media All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import CoreLocation
import MapKit
import Kingfisher

class PlaceDetailController: UIViewController,UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var placedetailTable: UITableView!
    @IBOutlet var segment: UISegmentedControl!

    var result: NBResult?
    var weekdayText: NSString?
    var pageTag: Int! = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageTag = 1
        self.weekdayText = ""
        self.placedetailTable.tableFooterView = UIView()
       // self.segment.addTarget(self, action: Selector(("segmentedControlValueChanged:")), for:.touchUpInside)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        let placeId : String = UserDefaults.standard.value(forKey: "placeid") as! String
        let url: String = String(format: "https://maps.googleapis.com/maps/api/place/details/json?placeid=%@&key=AIzaSyBz5XqYsIkKAm_a1umgqiQ-a_ond1gm9r0",placeId)

        Alamofire.request(
            URL(string: url)!,
            method: .get,
            parameters: ["include_docs": "true"])
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    return
                }
                print(response)
                let JSON: NSDictionary = (response.result.value as? NSDictionary)!

                let placeDetailObj: NBPlaceDetails = NBPlaceDetails.init(fromDictionary: JSON as! [String : Any])
                self.result = placeDetailObj.result!
                self.title = placeDetailObj.result?.name
                self.placedetailTable.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentedControlValueChanged(segment: UISegmentedControl)
    {
        if segment.selectedSegmentIndex == 0
        {
            pageTag = 1
            self.placedetailTable.reloadData()
        }
        else if segment.selectedSegmentIndex == 1
        {
            pageTag = 3
            self.placedetailTable.reloadData()
        }
        else
        {
            pageTag = 2
            self.placedetailTable.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if self.pageTag == 1
        {
            switch indexPath.row
            {
            case 0:
                return 200.0
            case 1:
                return 60.0
            case 2:
                return 140.0
            case 3:
                if self.result?.openingHours?.weekdayText == nil
                {
                    return 0
                }
                else
                {
                    return 200.0
                }
            default:
                return 0
                /*
                 if indexPath.row - 4 < (self.result?.photos?.count)!
                 {
                 return 200.0
                 }
                 else
                 {
                 return 100.0
                 }
                 */
            }
        }
        else if self.pageTag == 2
        {
            return 200
        }
        else
        {
            return 100
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if self.pageTag == 1
        {
            if self.result != nil
            {
                return 4
            }
        }
        else if self.pageTag == 2
        {
            if self.result != nil
            {
                if self.result?.photos != nil
                {
                    return (self.result?.photos?.count)!
                }
            }
        }
        else
        {
            if self.result != nil
            {
                if self.result?.reviews != nil
                {
                    return (self.result?.reviews?.count)!
                }
            }
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var reuseIdentifier = "detailcell"

        if self.pageTag == 1
        {
            switch indexPath.row
            {
            case 0:
                reuseIdentifier =  "detailcell"
            case 1:
                reuseIdentifier =  "phonecell"
            case 2:
                reuseIdentifier =  "addresscell"
            case 3:
                reuseIdentifier =  "timingcell"
            default:
                reuseIdentifier =  "detailcell"
                /*
                 if indexPath.row - 4 < (self.result?.photos?.count)!
                 {
                 reuseIdentifier =  "photocell"
                 }
                 else
                 {
                 reuseIdentifier = "commentcell"
                 }
                 */
            }
        }
        else if self.pageTag == 2
        {
            reuseIdentifier = "photocell"
        }
        else
        {
            reuseIdentifier = "commentcell"
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! PlaceDetailTableViewCell

        if self.pageTag == 1
        {
            switch indexPath.row
            {
            case 0:
                let coord : CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: (self.result?.geometry?.location?.lat?.doubleValue)!, longitude: (self.result?.geometry?.location?.lng?.doubleValue)!)
                let anno : MKPointAnnotation = MKPointAnnotation.init()
                anno.coordinate = coord
                cell.map.addAnnotation(anno)

                let span = MKCoordinateSpanMake(0.5, 0.5)
                let region = MKCoordinateRegion(center: coord, span: span)
                cell.map.setRegion(region, animated: true)
            case 1:
                cell.phone.text = self.result?.formattedPhoneNumber
            case 2:
                cell.address.text = self.result?.formattedAddress
            case 3:
                cell.timing.text = self.result?.openingHours?.weekdayText?.joined(separator: "\n\n")
            default:
                print(pageTag)
                /*
                if indexPath.row - 4 < (self.result?.photos?.count)!
                {
                    let refrence : String = (self.result?.photos![indexPath.row-4].photoReference)!
                    let resource : String = String(format: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=%@&key=AIzaSyBz5XqYsIkKAm_a1umgqiQ-a_ond1gm9r0",refrence)
                    let url = URL.init(string: resource)
                    cell.photo.kf.setImage(with: url)
                }
                else
                {
                    let c : Int = (self.result?.photos?.count)! + 4
                    let qn: Int = indexPath.row - c
                    if qn <  (self.result?.reviews?.count)!
                    {
                        let review : NBReview = (self.result?.reviews![indexPath.row - c])!
                        cell.reviewAuthor.text = review.authorName
                        cell.commentText.text = review.text
                    }
                }
               */
            }
        }
        else if self.pageTag == 2
        {
            let refrence : String = (self.result?.photos![indexPath.row].photoReference)!
            let resource : String = String(format: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=%@&key=AIzaSyBz5XqYsIkKAm_a1umgqiQ-a_ond1gm9r0",refrence)
            let url = URL.init(string: resource)
            cell.photo.kf.setImage(with: url)
        }
        else
        {
            let review : NBReview = (self.result?.reviews![indexPath.row])!
            cell.reviewAuthor.text = review.authorName
            cell.commentText.text = review.text
        }
        return cell
    }
}
