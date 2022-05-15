//
//  RegisterUserValidation.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 15/05/22.
//

import Foundation



struct RegisterUserValidation {
    
    func validateNewUser(registerUserRquest:RegisterUserRequest) ->ValidationResult {
        
        if registerUserRquest.userName!.isEmpty {
            
            return ValidationResult(success: false, error: "User name is empty")
        }
        
        else if registerUserRquest.email!.isEmpty {
            return ValidationResult(success: false, error:"user email is empty")
        }
        
       else  if registerUserRquest.password!.isEmpty {
            return ValidationResult(success: false, error:"user password is empty")
        }
        
        else if registerUserRquest.password!.count < 8 {
            return ValidationResult(success: false, error:"Password length should be greater than eight characters")
        }
        
        return  ValidationResult(success: true, error: nil)
    }
    
}
