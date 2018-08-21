//
//  HomeViewController.swift
//  Nearby
//
//  Created by WSCube Tech on 22/06/18.
//  Copyright © 2018 WS Cube Tec h. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource
{
    
    var listArr = NSArray()
    @IBOutlet var myhomeCollection: UICollectionView?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if UserDefaults.standard.value(forKey: "city") != nil
        {
            self.title = UserDefaults.standard.value(forKey: "city") as? String
        }
        //Adding plist into program
        let path: String = Bundle.main.path(forResource: "Type", ofType: "plist")!
        
        listArr = NSArray.init(contentsOfFile: path)!
        print(listArr)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1     //return number of sections in collection view
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.listArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let reuseIdentifier = "cell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! HomeCollectionViewCell
        cell.bgView.layer.borderColor = UIColor.black.cgColor
        cell.bgView.layer.borderWidth = 1.0
        cell.backgroundColor = UIColor.clear
        
        let dict: NSDictionary = listArr.object(at: indexPath.row) as! NSDictionary
        print(dict)
        let typeStr: String = dict.value(forKey: "type") as! String
        let nameStr: String = dict.value(forKey: "name") as! String
        cell.name.text = nameStr
        cell.icon.image = UIImage.init(named: typeStr)
        return cell
    }
    
    fileprivate var sectionInsets: UIEdgeInsets {
        return .zero
    }
    
    fileprivate var itemsPerRow: CGFloat {
        return 3
    }
    
    fileprivate var interitemSpace: CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let sectionPadding = sectionInsets.left * (itemsPerRow + 1)
        let interitemPadding = max(0.0, itemsPerRow - 1) * interitemSpace
        let availableWidth = collectionView.bounds.width - sectionPadding - interitemPadding
        let widthPerItem = availableWidth / itemsPerRow
        //let heightperitem = widthPerItem - 10.0
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interitemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let dict: NSDictionary = listArr.object(at: indexPath.row) as! NSDictionary
        
        let typeStr: String = dict.value(forKey: "type") as! String
        let nameStr: String = dict.value(forKey: "name") as! String
        UserDefaults.standard.set(typeStr, forKey: "type")
        UserDefaults.standard.set(nameStr, forKey: "typename")
        
        self.performSegue(withIdentifier: "datalist", sender: nil)
    }

}
