//
//  ProfileViewController.swift
//  coredata uikit
//
//  Created by Visakh D on 29/09/21.
//

import UIKit

class ProfileViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var nameTextFieldLabel: UILabel!
    @IBOutlet weak var usernameTextFieldLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutButton(_ sender: UIButton) {
        UserDefaults.standard.setValue(false, forKey: "ISUSERLOGGEDIN")
        self.navigationController?.popViewController(animated: true)
    }
    
}
