//
//  LoginResponse.swift
//  RadarBursatil
//
//  Created by Ronaldo Andre on 2/03/26.
//

import Foundation

public struct LoginResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let tokenType: String
    let expiresIn: Int
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken =  "refresh_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case user
    }
}

public struct User: Codable {
    
    let userId: String
    let email: String
    let firstName: String
    let lastName: String
    let profilePicture: String?
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case profilePicture = "profile_picture"
    }
}
