//
//  ProfileViewController.swift
//  coredata uikit
//
//  Created by Visakh D on 29/09/21.
//

import UIKit

class ProfileViewController: UIViewController  {
    
    @IBOutlet weak var profilephoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    weak var rootDelegate: RootSwitching?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // rootdelegate setting
        rootDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        
        profilephoto.backgroundColor = .secondarySystemBackground
        
        getUser()

    }
    
    
    @IBAction func logoutButton(_ sender: UIButton) {
        UserDefaults.standard.setValue(false, forKey: "LOGGEDIN")
        
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
    
    func imageCoreData() {
        
        if let   myImage = profilephoto.image?.pngData() {
        
            CoreData.shared.storedImages(image: myImage)
        }
    }
    
  
    
    
    func getUser() {
        
     let userInfo =  CoreData.shared.passData()
        var getName = nameLabel.text
        var getUserName = usernameLabel.text
        var getEmail = emailLabel.text
        
        getName = userInfo.name
        getUserName = userInfo.username
        getEmail = userInfo.email
        
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
        
        imageCoreData()
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        self.dismiss(animated: true, completion: nil)
        
    }
}


