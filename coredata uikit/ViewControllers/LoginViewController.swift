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
            let toDoTableHome = self.storyboard?.instantiateViewController(withIdentifier: "TabHomeViewController") as!  TabHomeViewController
            
            self.navigationController?.pushViewController(toDoTableHome, animated: true)
        }
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        //        if  usernameText.text == "" && passwordText.text == "" {
        //            UserDefaults.standard.setValue(true, forKey: "ISUSERLOGGEDIN")
        
       
        
        
        
        rootDelegate?.loginSucceed()
        //        }
    }
}
