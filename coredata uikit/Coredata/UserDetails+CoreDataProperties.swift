//
//  UserDetails+CoreDataProperties.swift
//  coredata uikit
//
//  Created by Visakh D on 18/10/21.
//
//

import Foundation
import CoreData


extension UserDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDetails> {
        return NSFetchRequest<UserDetails>(entityName: "UserDetails")
    }

    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var storedImage: Data?
    @NSManaged public var userID: UUID?

}

extension UserDetails : Identifiable {

}
