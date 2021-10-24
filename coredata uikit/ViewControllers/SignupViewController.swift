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
        
    //   validation process of signup page
        
        if password != confirmPassword || password.isEmpty {
           
            showAlertError()
        }
        else if password == confirmPassword {

            
            UserDefaults.standard.setValue(false, forKey: "LOGGEDIN")
            showAlertSucess()
            
            //   storing the data of signup in core data & navigation to home
                
                validatelogin(Name: name, usrName: usrName, email: email, password: password, confirmpassword: confirmPassword)
                
                rootDelegate?.logOut()
            
            return
        }
        
  
        
        
    }
    
    //    alert functions for signup page
    
    func showAlertSucess() {
        let alert = UIAlertController(title: "Congrats", message: "Sucessfully Completed SiginUp", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style:.cancel, handler: {action in print("Action completed")}))
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertError() {
        let alert = UIAlertController(title: "ERROR", message: "Password Do not MAtch", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style:.destructive, handler: {action in print("error completed")}))
        present(alert, animated: true, completion: nil)

    }
    
//     cancel code for dismissing the page
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    
    // MARK: Function to validate and store to  core data
    
    func validatelogin (Name:String , usrName:String , email:String , password:String, confirmpassword:String)  {
        if  password == confirmpassword  {
            
            CoreData.shared.userProfileModel(name: Name, username: usrName, email: email, password:password)
            
        }
    }
}

