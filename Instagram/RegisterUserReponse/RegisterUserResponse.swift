//
//  RegisterUserResponse.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 16/05/22.
//

import Foundation


struct RegisterUserResponse :Decodable{
    
    var errorMessage: String? = "Error while login with User id and password"
    let data: RegisterUserResponseData?
}


struct RegisterUserResponseData : Decodable
{
    let userName: String
    let userID: Int
    let email: String

    enum CodingKeys: String, CodingKey {
        case userName
        case userID = "userId"
        case email
    }
}
