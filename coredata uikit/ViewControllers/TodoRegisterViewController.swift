//
//  TodoRegisterViewController.swift
//  coredata uikit
//
//  Created by Visakh D on 01/10/21.
//

import UIKit

class TodoRegisterViewController: UIViewController {

    @IBOutlet weak var titletextField: UITextField!
    @IBOutlet weak var todoImageLogo: UIButton!
    
    @IBOutlet weak var descriptionlabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion:nil)
    }
    

    @IBAction func submitButton(_ sender: Any) {
    }
    

}
