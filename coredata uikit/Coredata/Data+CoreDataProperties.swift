//
//  Data+CoreDataProperties.swift
//  coredata uikit
//
//  Created by Visakh D on 01/10/21.
//
//

import Foundation
import CoreData


extension Data {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Data> {
        return NSFetchRequest<Data>(entityName: "Data")
    }

    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?

}

extension Data : Identifiable {

}
