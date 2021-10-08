//
//  TodoRegisterViewController.swift
//  coredata uikit
//
//  Created by Visakh D on 01/10/21.
//

import UIKit

class TodoRegisterViewController: UIViewController {
    
    weak var rootDelegate: RootSwitching?
    
    
    
    @IBOutlet weak var titletextField: UITextField!
    
    
    @IBOutlet weak var descriptionTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
    }
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion:nil)
    }
    
    
    @IBAction func submitButton(_ sender: Any) {
        
        let toDoTitle = titletextField.text!
        let descp = descriptionTextField.text!
        
        if toDoTitle.isEmpty && descp.isEmpty {
            
            showAlertError()
            
            
        }
        else{
            
            //     calling the save function  and alert funtion
            
            saveToDo(toDoTitle: toDoTitle, descp: descp)
            
            
            //        to dismiss the view from reg page after saving and to go back to home page
            
            rootDelegate?.dismissregister()
            
        }
        
    }
    
    
    func showAlertError() {
        let alert = UIAlertController(title: "ERROR", message: "Text empty ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style:.destructive, handler: {action in print("error completed")}))
        present(alert, animated: true, completion: nil)
        
        
    }
    
    //    function to save the to do items to core data
    
    
    func saveToDo(toDoTitle:String, descp:String) {
        CoreData.shared.createToDoItem(title: toDoTitle, content: descp)
    }
}
