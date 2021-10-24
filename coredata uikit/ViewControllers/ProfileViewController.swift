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
        
        // fetching user details from the  core data of the user to show it on the profile
        let userInfo =  CoreData.shared.passData()
        nameLabel.text = userInfo.name
        usernameLabel.text = userInfo.username
        emailLabel.text = userInfo.email
        
       
    }
    
 
    override func viewWillDisappear(_ animated: Bool) {
        let showImage = CoreData.shared.fetchImage()
         profilephoto.image = UIImage(data: (showImage?.storedImage)!)
    }
    
    
    @IBAction func logoutButton(_ sender: UIButton) {
        UserDefaults.standard.setValue(false, forKey: "LOGGEDIN")
        
        rootDelegate?.logOut()
        
        
    }
    
    @IBAction func uploadProfpicButton(_ sender: UIButton) {
        actionSheet()
        
    }
    
   // action sheet is used for the pop buttons for taking the image
    
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
   
//    function to save image in the core data
    
    func imageCoreData() {
        
        if let   myImage = profilephoto.image?.pngData() {
            
            CoreData.shared.storedImages(image: myImage)
        }
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


