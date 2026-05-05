//
//  ConfirmVerificationResponse.swift
//  VerificarEmail
//
//  Created by Ronaldo Andre on 30/04/26.
//

import Foundation

public struct ConfirmVerificationResponse: Decodable {
    let message: String
    let success: Bool
}
