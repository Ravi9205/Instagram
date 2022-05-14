//
//  LoginResource.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 13/05/22.
//

import Foundation
import FirebaseAuth

struct LoginResource{
    

    func loginUser(loginRequest:LoginRequest, completion:@escaping((Bool) -> Void)){
        
        guard let email = loginRequest.email , let password = loginRequest.password else {
                return
            }
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                
                guard authResult != nil , error == nil else {
                    completion(false)
                    return
                }
                
                completion(true)
            }
            
        }
    
}
