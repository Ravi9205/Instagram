//
//  LoginViewModel.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 14/05/22.
//

import Foundation
import FirebaseAuth


protocol LoginViewModelProtocal {
    
    func didReceiveResponse(loginResponse:LoginResponse?)
}


struct LoginViewModel {
    
    var delegate:LoginViewModelProtocal?
    
    func loginUser(loginRequest:LoginRequest, completion:@escaping((Bool) -> Void)){
        
        let validationResult = LoginValidation().validate(loginRequest: loginRequest)
        
        if validationResult.success {
            
            let loginResource = LoginResource()
            loginResource.loginUser(loginRequest: loginRequest) { success in
                
                if success {
                    // IF response succeed
                    completion(true)
                }
                else {
                    // If it fails
                    completion(false)
                }
                
            }
        }
        delegate?.didReceiveResponse(loginResponse: LoginResponse(errorMessage:validationResult.error,data:nil))
    }
    
}
