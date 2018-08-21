//
//  BookmarkViewController.swift
//  Nearby
//
//  Created by Navdeep Charan on 16/06/18.
//  Copyright © 2018 Mithra Media All rights reserved.
//

import UIKit
import Kingfisher
import CoreData

class BookmarkViewController: UIViewController, UITableViewDelegate,UITableViewDataSource
{

    var db: OpaquePointer?
    public var myresults : Array<Results>?
    @IBOutlet var mytable: UITableView! = nil
    var result: [NSManagedObject]!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.mytable.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Bookmarklist")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            self.result = try context.fetch(request) as! [NSManagedObject]
            for data in self.result
            {
                print(data.value(forKey: "name") as! String)
                print(data.value(forKey: "address") as! String)
                print(data.value(forKey: "category") as! String)
                print(data.value(forKey: "icon") as! String)
            }
        } catch {
            print("Failed")
        }
        self.mytable.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if self.result != nil
        {
            return (self.result?.count)!
        }
        return 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 135.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookmarkTable", for: indexPath) as! MyTableViewCell
        let data: NSManagedObject = self.result[indexPath.row]

        print(data.value(forKey: "name") as! String)
        print(data.value(forKey: "address") as! String)
        print(data.value(forKey: "category") as! String)
        print(data.value(forKey: "icon") as! String)

        cell.Name.text = data.value(forKey: "name") as? String
        cell.address.text = data.value(forKey: "address") as? String
        let icon: String = data.value(forKey: "icon") as! String

        let url = URL.init(string: icon)
        cell.img.kf.setImage(with: url)
        cell.btn.tag = indexPath.row

        return cell
    }
}
