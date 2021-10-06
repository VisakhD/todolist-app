//
//  TodoRegisterViewController.swift
//  coredata uikit
//
//  Created by Visakh D on 01/10/21.
//

import UIKit

class TodoRegisterViewController: UIViewController {

    @IBOutlet weak var titletextField: UITextField!
 
    
    @IBOutlet weak var descriptionTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion:nil)
    }
    

    @IBAction func submitButton(_ sender: Any) {
        
        let toDoTitle = titletextField.text!
        let descp = descriptionTextField.text!
        
//     calling the save function  and alert funtion 
        
        saveToDo(toDoTitle: toDoTitle, descp: descp)
        
        showAlertSucess()
        
        self.dismiss(animated: true, completion: nil)

//        to dismiss the view from reg page after saving and to go back to home page
        
        self.navigationController?.popViewController(animated: true)
       
    }
    
    func showAlertSucess() {
            let alert = UIAlertController(title: "Congrats", message: "ToDoIteam Succefully Created", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style:.cancel, handler: {action in print("Action completed")}))
        present(alert, animated: true, completion: nil)
    }
    
//    function to save the to do items to core data

    
    func saveToDo(toDoTitle:String, descp:String) {
        CoreData.shared.createToDoItem(title: toDoTitle, content: descp)
    }
}
