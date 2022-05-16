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


extension RegisterViewController:RegisterUserViewModelProtocal{
    
    func didReceiveRegisterUserResponse(response: RegisterUserResponse) {
        
        if response.errorMessage == nil {
            // Go ahead and do something
        }
        
        else if (response.errorMessage != nil){
            
            let alert = UIAlertController(title: Constants.ErrorAlertTitle, message: response.errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Constants.OkAlertTitle, style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}
