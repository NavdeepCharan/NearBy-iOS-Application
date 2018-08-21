//
//  Bookmarklist+CoreDataProperties.swift
//  
//
//  Created by WSCube Tech on 25/06/18.
//
//

import Foundation
import CoreData


extension Bookmarklist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bookmarklist> {
        return NSFetchRequest<Bookmarklist>(entityName: "Bookmarklist")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var icon: String?
    @NSManaged public var category: String?
    @NSManaged public var bookmarkid: String?

}
