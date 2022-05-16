//
//  RegisterUserResource.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 15/05/22.
//

import Foundation
import FirebaseAuth


struct RegisterUserResource {
    
    
    func register(registerUserRquest:RegisterUserRequest,completion:@escaping(Bool)->Void){
        
        
        guard let userName = registerUserRquest.userName, let email = registerUserRquest.email ,let password = registerUserRquest.password  else {
            return
        }
        
        DatabaseManger.shared.canCreateNeeUser(with: email, userName: userName) { success in
            if success {
                // Insert into Database
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    
                    guard authResult != nil , error == nil else {
                        completion(false)
                        return
                    }
                     //Insert Into Database
                    //completion(success)
                    
                    DatabaseManger.shared.insertNewUser(with: email, userName: userName) { success in
                        
                        if success {
                            completion(true)
                            return
                        }
                        else {
                            completion(false)
                            return
                        }
                    }
                    
                }
                
            }
            else {
                completion(false)
            }
        }
    }
    
}
