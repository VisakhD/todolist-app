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
 
    weak var rootDelegate: RootSwitching?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // rootdelegate setting
        rootDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: Button Actions
    @IBAction func saveDataButton(_ sender: UIButton) {
      
        let name = nameTextField.text!
        let usrName = usernameTextfield.text!
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let confirmPassword = confirmPasswordField.text!
        
//        validatelogin(Name: name, usrName: usrName, email: email, password: password, confirmpassword: confirmpassword)
        
       if password == confirmPassword {
            UserDefaults.standard.setValue(true, forKey: "ISUSERLOGGEDIN")
        }
        
        rootDelegate?.loginSucceed()
    }
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }

    
    
    // MARK: Function to validate and store to  core data
    func validatelogin (Name:String , usrName:String , email:String , password:String, confirmpassword:String)  {
        if  password == confirmpassword {
            
            CoreData.shared.userProfileModel(name: Name, username: usrName, email: email, password:password)
            
        }
    }
}
