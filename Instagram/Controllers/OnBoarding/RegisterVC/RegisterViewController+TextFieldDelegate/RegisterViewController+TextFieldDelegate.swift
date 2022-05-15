//
//  RegisterViewController+TextFieldDelegate.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 15/05/22.
//

import Foundation
import UIKit


extension RegisterViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userNameTextField {
            emailTextField.becomeFirstResponder()
        }
        else if(textField == emailTextField){
            passwordTextField.becomeFirstResponder()
        }
            
        else {
            didTapRegister()
        }
        
        return true
    }
}
