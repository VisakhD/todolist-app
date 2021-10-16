//
//  ToDoItem+CoreDataProperties.swift
//  coredata uikit
//
//  Created by Visakh D on 15/10/21.
//
//

import Foundation
import CoreData


extension ToDoItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoItem> {
        return NSFetchRequest<ToDoItem>(entityName: "ToDoItem")
    }

    @NSManaged public var content: String?
    
    @NSManaged public var title: String?
    @NSManaged public var state: Bool

}

extension ToDoItem : Identifiable {

}
