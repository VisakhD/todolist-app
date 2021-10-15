//
//  loginViewController.swift
//  coredata uikit
//
//  Created by Visakh D on 28/09/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    weak var rootDelegate: RootSwitching?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // rootdelegate setting
        rootDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        
        if UserDefaults.standard.bool(forKey: "LOGGEDIN") == true {
            rootDelegate?.loginSucceed()
            
            
        }
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        let user = usernameText.text!
        let pass = passwordText.text!
        
//        validation code if its emppty  else it will nacvigat to home
        
        let   logInDone = CoreData.shared.loginValidate(name: user, pass: pass)
        if  logInDone {
//
            
            UserDefaults.standard.setValue( true, forKey: "LOGGEDIN")
            rootDelegate?.loginSucceed()
        }
        else {

            showAlertError()
        }
    
//    
//    alert func of the validation 
    
    func showAlertError() {
        let alert = UIAlertController(title: "ERROR", message: "Text empty/Error", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style:.destructive, handler: {action in print("error completed")}))
        present(alert, animated: true, completion: nil)
        
        
    }
}


}
