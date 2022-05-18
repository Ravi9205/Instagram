//
//  AuthManager.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 13/05/22.
//

import Foundation
import FirebaseAuth

public class AuthManager{
    
    static let shared = AuthManager()
    
    private init(){}

    //MARK:- For Registering New User
    public func registerNewUser(with userName:String,email:String, password:String){
         
    }
    
    
    //MARK:- Login User
    public func loginUser(with username:String?, email:String?, password:String,completion:(Bool)->Void){
        
    }
    
    //MARK:- LogOut from Firebase
    public func LogOut(completion:(Bool)->Void){
        do {
            try  Auth.auth().signOut()
            completion(true)
        }
        catch {
            print("Error while Logging Out")
            completion(false)
        }
    }
}
