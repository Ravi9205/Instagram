//
//  LoginResponse.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 14/05/22.
//

import Foundation


struct LoginResponse : Decodable {

    var errorMessage: String? = "Error while login with User id and password"
    let data: LoginResponseData?
}

struct LoginResponseData : Decodable
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
