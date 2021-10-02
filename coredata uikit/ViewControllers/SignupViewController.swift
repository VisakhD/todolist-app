//
//  signupViewController.swift
//  coredata uikit
//
//  Created by Visakh D on 28/09/21.
//

import UIKit

class SignupViewController: UIViewController   {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
 

 
//    var imagepickercontroller = UIImagePickerController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveDataButton(_ sender: UIButton) {
      
        let Name = nameTextField.text!
        let  usrName = usernameTextfield.text!
        let  email = emailTextField.text!
        let  password = passwordTextField.text!
        let confirmpassword = confirmPasswordField.text!
        
        validatelogin(Name: Name, usrName: usrName, email: email, password: password, confirmpassword: confirmpassword)
        
       if password == confirmpassword {
            UserDefaults.standard.setValue(true, forKey: "ISUSERLOGGEDIN")
        let toDoTableHome = self.storyboard?.instantiateViewController(withIdentifier: "TabHomeViewController") as! TabHomeViewController
        self.navigationController?.pushViewController(toDoTableHome, animated: true)
        }
    }
    
    
//    function to validate and store to  core data 
    func validatelogin (Name:String , usrName:String , email:String , password:String, confirmpassword:String)  {
        if  password == confirmpassword {
            
            CoreData.shared.userProfileModel(name: Name, username: usrName, email: email, password:password)
            
        }
    }

  
    
    
    
    
}
