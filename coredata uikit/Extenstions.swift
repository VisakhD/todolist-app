//
//  Extenstions.swift
//  coredata uikit
//
//  Created by Aby Mathew on 03/10/21.
//

import Foundation
import UIKit

extension UIViewController : UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
