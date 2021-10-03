//
//  CoreData Manager.swift
//  coredata uikit
//
//  Created by Visakh D on 01/10/21.
//

import Foundation
import CoreData

class CoreData {
    
    static let shared  = CoreData()
    private init () {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "coredata_uikit")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    
    
    //To do list
    
    var  userProfile : [Data]?
    // saving user data in core data
    func userProfileModel (name:String,username:String,email:String,password:String)  {
        let context = CoreData.shared.persistentContainer.viewContext
        
        let toDolist = NSEntityDescription.insertNewObject(forEntityName: "Data", into: context)
        toDolist.setValue(name, forKey: "name")
        toDolist.setValue(username, forKey: "username")
        toDolist.setValue(email, forKey: "email")
        toDolist.setValue(password, forKey: "password")
        try! context.save()
        print("ITEAM SAVED")
        
    }
    
    func fetchData()   {
        do {
            userProfile = try
                CoreData.shared.persistentContainer.viewContext.fetch(Data.fetchRequest())
            print("hello",userProfile?.count ?? 0)
        }
        catch{}
    }
    
    
}







