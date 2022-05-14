//
//  TextField+Delegate.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 13/05/22.
//

import Foundation
import UIKit


extension LoginViewController:UITextFieldDelegate , LoginViewModelProtocal{
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField{
            loginButtonTapped()
        }
        
        return true
    }
    
    
    func didReceiveResponse(loginResponse: LoginResponse?) {
        
        if loginResponse?.errorMessage == nil {
            
        }
        else  if (loginResponse?.errorMessage != nil) {
            
            let alert = UIAlertController(title: Constants.ErrorAlertTitle, message: loginResponse?.errorMessage, preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: Constants.OkAlertTitle, style: .default, handler: nil))
             self.present(alert, animated: true)
        }
        
    }
    
    
    
}
