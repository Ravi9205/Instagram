//
//  LoginValidation.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 13/05/22.
//

import Foundation


struct LoginValidation {
    
    func validate(loginRequest:LoginRequest) ->ValidationResult
    {
        if (loginRequest.email!.isEmpty){
            return ValidationResult(success: false, error: "User email is empty")
        }
        
        else if (loginRequest.password!.isEmpty){
            return ValidationResult(success: false, error: "User password can't be empty")
        }
        
        else if (loginRequest.password!.count <  8){
            return ValidationResult(success: false, error: "Password length should be of 8 characters at least")

        }
        return ValidationResult(success: true, error: nil)
    }
}
