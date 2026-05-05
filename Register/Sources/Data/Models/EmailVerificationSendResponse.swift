//
//  EmailVerificationSendResponse.swift
//  Register
//
//  Created by Ronaldo Andre on 1/04/26.
//

import Foundation

struct EmailVerificationSendResponse: Codable {
    let message: String
    let success: Bool
    let expiresInSeconds: Int
    let resendAfterSeconds: Int
    
    enum CodingKeys: String, CodingKey {
        case message
        case success
        case expiresInSeconds = "expires_in_seconds"
        case resendAfterSeconds = "resend_after_seconds"
    }
}
