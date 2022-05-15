//
//  RegisterUserViewModel.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 15/05/22.
//

import Foundation


struct RegisterUserViewModel
{
    
    func register(regitserRequest:RegisterUserRequest,completion:@escaping(Bool)->Void){
        
        let validation = RegisterUserValidation().validateNewUser(registerUserRquest: regitserRequest)
        
        if validation.success {
            
            let registerUserResource = RegisterUserResource()
            registerUserResource.register(registerUserRquest: regitserRequest) { success in
                if success {
                    // REGISTER SUCCESSFULLY
                    completion(true)
                }
                else {
                    //FAILD TO REGISTER USER
                    completion(false)
                }
            }
            
        }
        
    }
    
}
