//
//  moreViewController.swift
//  foodApp
//
//  Created by Navdeep Charan on 31/03/18.
//  Copyright © 2018 Mithra Media. All rights reserved.
//

import UIKit
import CoreData

class MoreViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var MoreTable: UITableView!
    var result: [NSManagedObject]!
    var imagePicker = UIImagePickerController()
    @IBOutlet weak var imagePreview: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.MoreTable.tableFooterView = UIView()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let email : String = UserDefaults.standard.value(forKey: "username") as! String
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.predicate = NSPredicate(format: "email = %@",email)
        request.returnsObjectsAsFaults = false
        do
        {
            self.result = try context.fetch(request) as! [NSManagedObject]
        }
        catch
        {
            print("Failed")
        }
    }

    @IBAction func AddImageButton(sender : AnyObject)
    {

        // self.presentModalViewController(imagePicker, animated: true)
        self.present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])


    {
        let tempImage:UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imagePreview.image  = tempImage
        //self.dismissModalViewControllerAnimated(true)
        self.dismiss(animated: true, completion: nil)

    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {

        // self.dismissModalViewControllerAnimated(true)

        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 0
        {
            return 90.0
        }
        return 45.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myprofile", for: indexPath) as! MoreFirstTableViewCell
            cell.email.text = UserDefaults.standard.value(forKey: "username") as? String
            if self.result != nil && self.result.count > 0
            {
                let user: User = self.result[0] as! User
                cell.name.text = String(format: "%@ %@",user.firstname!,user.lastname!)
            }
            else
            {
                cell.name.text = UserDefaults.standard.value(forKey: "name") as? String
            }
            return cell
        }
        else if indexPath.row == 1
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "changecity", for: indexPath) as! MoreFirstTableViewCell

            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "logout", for: indexPath) as! MoreFirstTableViewCell

            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row == 1
        {
            self.dismiss(animated: true, completion: nil)
        }
        else if indexPath.row == 2
        {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "loginHome") as! UIViewController
            UIApplication.shared.keyWindow?.rootViewController = viewController
        }
    }



}
