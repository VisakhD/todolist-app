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
    //    user details array created and moved to the top
    
    var  userProfile : [UserDetails]?

    var toDotable : [ToDoItem]?
    
    var strimages : [UserDetails]?
    
    let fetchRequest: NSFetchRequest<UserDetails> = UserDetails.fetchRequest()
    //    let userFetchRequest = NSFetchRequest<NSFetchRequestResult>( entityName: "UserDetails")
    
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
    private init () {}
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // saving user data in core data
    func userProfileModel (name:String,username:String,email:String,password:String)  {
        let context = persistentContainer.viewContext
        
        let toDolist = NSEntityDescription.insertNewObject(forEntityName: "UserDetails", into: context)
        toDolist.setValue(name, forKey: "name")
        toDolist.setValue(username, forKey: "username")
        toDolist.setValue(email, forKey: "email")
        toDolist.setValue(password, forKey: "password")
        try! context.save()
        
        
    }
    
    func fetchData()   {
        do {
            userProfile = try
                persistentContainer.viewContext.fetch(UserDetails.fetchRequest())
            print("fetched",userProfile?.count ?? 0)
        }
        catch{}
    }
    
    //MARK: Login validation code
    func loginValidate(name:String,pass:String) -> Bool {
        
        
        let pred1 = NSPredicate(format: "username LIKE %@" , name)
        let pred2 = NSPredicate(format: "password LIKE %@" , pass)
        let fetchRequest: NSFetchRequest<UserDetails> = UserDetails.fetchRequest()
        fetchRequest.predicate = pred1
        fetchRequest.predicate = pred2
        
        do {
            let userDetailsArray = try persistentContainer.viewContext.fetch(fetchRequest)
            
            if userDetailsArray.isEmpty == false
            {
                print(userDetailsArray)
                return true
            }
            
        } catch {
            print(error.localizedDescription)
        }
        return false
    
    }
    
    
    func passData()-> UserDetails {
        
            let userDetailsArray = try! persistentContainer.viewContext.fetch(fetchRequest) as NSArray
            let dataPass = (userDetailsArray.firstObject as! UserDetails)
            return dataPass
    
    }

    
    
    //MARK: Get data fetching all datas
    @discardableResult func getToDoItem() -> [ToDoItem] {
        let context = persistentContainer.viewContext
        let store = try! context.fetch(ToDoItem.fetchRequest()) as [ToDoItem]
        
        return store
    }
    
    
    //MARK:  Save data when submitted via register
    func createToDoItem (title:String,content:String) {
        let context = persistentContainer.viewContext
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "ToDoItem", into: context)
        item.setValue(title, forKey: "title")
        item.setValue(content, forKey: "content")
        try! context.save()
    }
    
    //MARK: DELETE ITEM
    func deleteToDoItem(item:ToDoItem){
        let context = persistentContainer.viewContext
        context.delete(item)
        do {
            try context.save()
        } catch  {
            //   error
        }
    }
    
    func updateToDoItem(item:ToDoItem , newtitle:String,newcontent:String) {
        let context = persistentContainer.viewContext
        item.title = newtitle
        item.content = newcontent
        item.state = true
        
        do {
            try context.save()
        } catch  {
            //   error
        }
        
    }
    
    //MARK:   PROFILE IMAGE  COREDATA
    
    func storedImages(image : Data) {
        let context = persistentContainer.viewContext
        
        
        let strImages = NSEntityDescription.insertNewObject(forEntityName: "UserDetails", into: context) as! UserDetails
       
        strImages.storedImage = image
        
        do {
            try context.save()
            print("saved")
        } catch let error as NSError {
            print("cannot save\(error),\(error.userInfo)")
        }
    }
    
    
    
    
}






