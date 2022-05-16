//
//  RegisterUserViewModel.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 15/05/22.
//

import Foundation


protocol RegisterUserViewModelProtocal:AnyObject {
    
    func didReceiveRegisterUserResponse(response:RegisterUserResponse)
}


struct RegisterUserViewModel
{
    
    weak var delegates:RegisterUserViewModelProtocal?
    
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
        delegates?.didReceiveRegisterUserResponse(response: RegisterUserResponse(errorMessage: validation.error, data: nil))
        
    }
    
}
