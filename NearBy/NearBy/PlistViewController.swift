//
//  plistViewController.swift
//  foodApp
//
//  Created by Navdeep Charan on 29/03/18.
//  Copyright © 2018 Mithra Media. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class PlistViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate
{

    var locationManager:CLLocationManager!
    var db: OpaquePointer?
    @IBOutlet weak var MyTableCity: UITableView!

    var cityArr = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.MyTableCity.tableFooterView = UIView()

        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()

        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }

        self.MyTableCity.delegate = self
        self.MyTableCity.dataSource = self
        // Do any additional setup after loading the view.

        //Adding plist into program
        let path: String = Bundle.main.path(forResource: "city", ofType: "plist")!

        cityArr = NSArray.init(contentsOfFile: path)!
        print(cityArr)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - location delegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let userLocation :CLLocation = locations[0] as CLLocation

        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if (error != nil){
                print("error in reverseGeocode")
            }
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count>0{
                let placemark = placemarks![0]
                print(placemark.locality!)
                print(placemark.administrativeArea!)
                print(placemark.country!)
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }

    //==================================

    //implementing city table


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50.0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cityArr.count+1
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
      let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableView", for: indexPath) as! MyTableViewCell

        if indexPath.row == 0
        {
            cell.Name.text = "Detect My Location"
            cell.Name.textColor = UIColor.blue
        }
        else
        {
            let dict: NSDictionary = cityArr.object(at: indexPath.row-1) as! NSDictionary
            print(dict)
            let arr: String = dict.value(forKey: "city") as! String
            print(arr)
            cell.Name.text = arr
            cell.Name.textColor = UIColor.black
        }
        return cell

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row == 0
        {
            let latitude: CLLocationDegrees = 26.2389
            let longitude: CLLocationDegrees = 73.0243
            let userLocation :CLLocation = CLLocation.init(latitude: latitude, longitude: longitude)
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
                if (error != nil){
                    print("error in reverseGeocode")
                }
                let placemark = placemarks! as [CLPlacemark]
                if placemark.count>0
                {
                    let placemark = placemarks![0]
                    print(placemark.locality!)
                    print(placemark.administrativeArea!)
                    print(placemark.country!)
                    let lat = placemark.location?.coordinate.latitude as NSNumber?
                    let lon = placemark.location?.coordinate.longitude as NSNumber?
                    UserDefaults.standard.set(placemark.locality, forKey: "city")
                    UserDefaults.standard.set(lat, forKey: "lat")
                    UserDefaults.standard.set(lon, forKey: "long")
                    self.performSegue(withIdentifier: "navigateTab", sender: nil)
                }
            }
        }
        else
        {
            let dict: NSDictionary = cityArr.object(at: indexPath.row-1) as! NSDictionary
            print(dict)
            let arr: String = dict.value(forKey: "city") as! String
            print(arr)
            let lat = dict.value(forKey: "lat") as? NSNumber
            let lon = dict.value(forKey: "long") as? NSNumber
            UserDefaults.standard.set(arr, forKey: "city")
            UserDefaults.standard.set(lat, forKey: "lat")
            UserDefaults.standard.set(lon, forKey: "long")
            self.performSegue(withIdentifier: "navigateTab", sender: nil)
        }
    }
}
