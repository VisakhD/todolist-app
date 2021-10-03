//
//  ProfileViewController.swift
//  coredata uikit
//
//  Created by Visakh D on 29/09/21.
//

import UIKit

class ProfileViewController: UIViewController  {

    @IBOutlet weak var profilephoto: UIImageView!
    @IBOutlet weak var nameTextFieldLabel: UILabel!
    @IBOutlet weak var usernameTextFieldLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UILabel!
    
    weak var rootDelegate: RootSwitching?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // rootdelegate setting
        rootDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        
        profilephoto.backgroundColor = .secondarySystemBackground
    }
    

    @IBAction func logoutButton(_ sender: UIButton) {
        UserDefaults.standard.setValue(false, forKey: "ISUSERLOGGEDIN")
        rootDelegate?.logOut()
   
    
    }
    
    @IBAction func uploadProfpicButton(_ sender: UIButton) {
        actionSheet()
        
    }
    
    func actionSheet()  {
        let alert =  UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Open Camera", style: .default, handler: {(handler) in self.openCamera() }))
        alert.addAction(UIAlertAction(title: "Gallary", style: .default, handler: {(handler) in self.openGallary() }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {(handler) in  }))
        
        self.present(alert, animated: true , completion: nil)
    }
    
    func openCamera() {
       
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker,animated: true)
            
    }
    
    func openGallary() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker,animated: true)
    
    }
    
}

extension ProfileViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("info")
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        
        profilephoto.image = image
        
    }

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        self.dismiss(animated: true, completion: nil)
        
    }
}


extension UINavigationController {
  func popToViewController(ofClass: LoginViewController, animated: Bool = true) {
    if let vc = viewControllers.last(where: { $0.isKind(of: LoginViewController.self) }) {
      popToViewController(vc, animated: animated)
    }
  }
}
