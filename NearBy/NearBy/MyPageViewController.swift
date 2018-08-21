//
//  MyPageViewController.swift
//  foodApp
//
//  Created by Navdeep Charan on 06/06/18.
//  Copyright © 2018 Mithra Media. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import CoreData

class MyPageViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{

    var db: OpaquePointer?
    public var myresults : Array<Results>?
    @IBOutlet var mytable: UITableView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mytable.tableFooterView = UIView()
        if UserDefaults.standard.value(forKey: "typename") != nil
        {
            self.title = UserDefaults.standard.value(forKey: "typename") as? String
        }
        let latitude = UserDefaults.standard.value(forKey: "lat") as! NSNumber
        let longitude = UserDefaults.standard.value(forKey: "long") as! NSNumber

        let type: String = (UserDefaults.standard.value(forKey: "type") as? String)!

        let lat: String = String(format: "%f",latitude.doubleValue)
        let lon: String = String(format: "%f",longitude.doubleValue)

        let url: String = String(format: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%@,%@&radius=5000&type=%@&key=AIzaSyBz5XqYsIkKAm_a1umgqiQ-a_ond1gm9r0",lat,lon,type)
        // From Almofire
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

                let placeDetailObj: Json4Swift_Base = Json4Swift_Base.init(dictionary: JSON)!
                self.myresults = placeDetailObj.results!
                self.mytable.reloadData()

        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if self.myresults != nil
        {
            return (self.myresults?.count)!
        }
        return 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTable", for: indexPath) as! MyTableViewCell

        let res : Results = self.myresults![indexPath.row]
        cell.Name.text = res.name
        cell.address.text = res.vicinity
        let url = URL.init(string: res.icon!)
        cell.img.kf.setImage(with: url)
        if UserDefaults.standard.value(forKey: res.id!) == nil || UserDefaults.standard.value(forKey: res.id!) as? Bool == false
        {
            cell.btn.imageView?.image = UIImage.init(named: "bookmarkEmpty")
        }
        else
        {
            cell.btn.imageView?.image = UIImage.init(named: "bookmarkfilled")
        }
        cell.btn.tag = indexPath.row

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let res : Results = self.myresults![indexPath.row]
        UserDefaults.standard.set(res.place_id, forKey: "placeid")

        self.performSegue(withIdentifier: "detail", sender: nil)
    }

    @IBAction func bookmark(_ sender: UIButton)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let res : Results = self.myresults![sender.tag]
        if UserDefaults.standard.value(forKey: res.id!) == nil || UserDefaults.standard.value(forKey: res.id!) as? Bool == false
        {
            UserDefaults.standard.set(true, forKey: res.id!)

            let entity = NSEntityDescription.entity(forEntityName: "Bookmarklist", in: context)
            let newmark = NSManagedObject(entity: entity!, insertInto: context)
            newmark.setValue(res.id, forKey: "bookmarkid")
            newmark.setValue(res.name, forKey: "name")
            newmark.setValue(res.vicinity, forKey: "address")
            newmark.setValue(res.icon, forKey: "icon")
            let type: String = (UserDefaults.standard.value(forKey: "type") as? String)!
            newmark.setValue(type, forKey: "category")
            do {
                try context.save()
            } catch {
                print("Failed saving")
            }
        }
        else
        {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Bookmarklist")
            fetchRequest.predicate = NSPredicate(format: "bookmarkid = %@",res.id!)
            let result = try? context.fetch(fetchRequest)
            let resultData = result as! [Bookmarklist]

            for object in resultData
            {
                context.delete(object)
            }
            do
            {
                try context.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {

            }
            UserDefaults.standard.set(false, forKey: res.id!)
        }
        let index : IndexPath = IndexPath.init(row: sender.tag, section: 0)
        self.mytable.reloadRows(at: [index], with: UITableViewRowAnimation.none)
    }

}
