//
//  Data+CoreDataProperties.swift
//  coredata uikit
//
//  Created by Visakh D on 28/09/21.
//
//

import Foundation
import CoreData


extension Data {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Data> {
        return NSFetchRequest<Data>(entityName: "Data")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: Int64

}

extension Data : Identifiable {

}
