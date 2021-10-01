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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButton(_ sender: UIButton) {
        
        
        
       
        
        if  usernameText.text == "" && passwordText.text == "" {
            UserDefaults.standard.setValue(true, forKey: "ISUSERLOGGEDIN")
        
        
        let toDoTableHome = self.storyboard?.instantiateViewController(withIdentifier: "ToDoTableViewController") as! ToDoTableViewController
        self.navigationController?.pushViewController(toDoTableHome, animated: true)
        }
    }
    

}
