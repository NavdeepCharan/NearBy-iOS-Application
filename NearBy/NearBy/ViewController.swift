//
//  ViewController.swift
//  foodApp
//
//  Created by Navdeep Charan on 22/03/18.
//  Copyright © 2018 Mithra Media. All rights reserved.
//

import UIKit
import GoogleSignIn
import Foundation.NSThread
import AVFoundation
import CoreFoundation

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self as! GIDSignInUIDelegate
        let path: String = Bundle.main.path(forResource: "city", ofType: "plist")!
        let arr = NSArray.init(contentsOfFile: path)
        let dict: NSDictionary = arr!.object(at: 0) as! NSDictionary
        print(dict)
        let lat: NSNumber = dict.value(forKey: "lat") as! NSNumber
        print(lat)
        let long: NSNumber = dict.value(forKey: "long") as! NSNumber
        print(long)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
