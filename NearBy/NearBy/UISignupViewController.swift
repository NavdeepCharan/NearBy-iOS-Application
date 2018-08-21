//
//  UISignupViewController.swift
//  foodApp
//
//  Created by Navdeep Charan on 29/03/18.
//  Copyright © 2018 Mithra Media. All rights reserved.
//

import UIKit
import CoreData

class UISignupViewController: UIViewController
{

    @IBOutlet var email: UITextField!
    @IBOutlet var firstname: UITextField!
    @IBOutlet var lastname: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var resetpassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveSignUp()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let user = NSManagedObject(entity: entity!, insertInto: context)
        if (password.text == "" && password.text != resetpassword.text)
        {

        }
        else
        {
            user.setValue(email.text, forKey: "email")
            user.setValue(firstname.text, forKey: "firstname")
            user.setValue(lastname.text, forKey: "lastname")
            user.setValue(password.text, forKey: "password")

            do {
                try context.save()
                UserDefaults.standard.set(email.text, forKey: "username")
                UserDefaults.standard.set(password.text, forKey: "password")
                self.performSegue(withIdentifier: "signupCityPage", sender: nil)
            } catch {
                print("Failed saving")
            }
        }
    }
}
