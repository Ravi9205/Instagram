//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 13/05/22.
//

import Foundation
import FirebaseDatabase


public class DatabaseManger{
    
    static let shared = DatabaseManger()
    
    private let database = Database.database().reference()
    
    private init(){}
    
    
    //MARK:- CHECKING USER IF ALREADY EXITS IN DATA BASE
    public func canCreateNeeUser(with email:String,userName:String,completion:(Bool)->Void){
        completion(true)
    }
    
    //MARK:- Insert New User Into database
    public func insertNewUser(with email:String, userName:String,completion:@escaping(Bool)->Void){
        database.child(email.safeDatabaseKey()).setValue(["username":userName]) { error, snapShots in
            
            if error == nil {
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
