//
//  VerificarEmailResponse.swift
//  Login
//
//  Created by Ronaldo Andre on 25/03/26.
//

import Foundation

struct VerificarEmailResponse: Codable {
    let detail: String
    let code: Bool
    let status: Int
}
