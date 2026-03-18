//
//  ErrorResponse.swift
//  Register
//
//  Created by Ronaldo Andre on 18/03/26.
//

import Foundation

struct ErrorResponse: Decodable {
    let detail: String
    let code: String?
    let status: Int?
}
