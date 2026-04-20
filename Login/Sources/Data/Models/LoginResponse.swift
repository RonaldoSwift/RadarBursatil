//
//  LoginResponse.swift
//  RadarBursatil
//
//  Created by Ronaldo Andre on 2/03/26.
//

import Foundation

public struct LoginResponse: Codable {
    let access_token: String
    let refresh_token: String
    let token_type: String
    let expires_in: Int
}
