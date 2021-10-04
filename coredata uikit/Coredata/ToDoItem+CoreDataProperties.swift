//
//  ToDoItem+CoreDataProperties.swift
//  coredata uikit
//
//  Created by Visakh D on 04/10/21.
//
//

import Foundation
import CoreData


extension ToDoItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoItem> {
        return NSFetchRequest<ToDoItem>(entityName: "ToDoItem")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?

}

extension ToDoItem : Identifiable {

}
