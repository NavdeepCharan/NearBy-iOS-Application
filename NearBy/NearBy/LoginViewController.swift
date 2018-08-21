//
//  LoginViewController.swift
//  foodApp
//
//  Created by Navdeep Charan on 28/03/18.
//  Copyright © 2018 Mithra Media. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate, UISearchBarDelegate
{
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!

    @IBOutlet weak var forgotepassword: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
     self.username.delegate = self
     self.password.delegate = self
        self.username.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: UIButton)
    {
        if UserDefaults.standard.value(forKey: "username") as? String != self.username.text
        {
            let alert=UIAlertController(title:"Warning", message: "Username not matched", preferredStyle:UIAlertControllerStyle.alert )

            alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler:
            {
                _ in print("FOO ")
            }))
            present(alert, animated: true, completion: nil)
        }
        else if UserDefaults.standard.value(forKey: "password") as? String != self.password.text
        {
            let alert=UIAlertController(title:"Warning", message: "Password is not matched", preferredStyle:UIAlertControllerStyle.alert )

            alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler:
                {
                    _ in print("FOO ")
            }))
            present(alert, animated: true, completion: nil)
        }
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        print("textFieldDidBeginEditing")
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        print("textFieldShouldEndEditing")
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField)
    {
        print("textFieldDidEndEditing")
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        print("textFieldDidEndEditing")
    }


    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        print("shouldChangeCharactersIn")
        print(string)
        if string == "%" || string == "&"
        {
            return false
        }
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool
    {
        print("textFieldShouldClear")
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
