//
//  TextField+Delegate.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 13/05/22.
//

import Foundation
import UIKit


extension LoginViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField{
            loginButtonTapped()
        }
        
        return true
    }
    
}
