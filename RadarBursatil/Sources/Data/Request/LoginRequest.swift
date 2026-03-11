//
//  LoginRequest.swift
//  RadarBursatil
//
//  Created by Ronaldo Andre on 2/03/26.
//

import Foundation

struct LoginRequest: Codable {
    let email: String
    let first_name: String
    let last_name: String
    let middle_name: String
    let password: String
    let confirm_password: String
}
