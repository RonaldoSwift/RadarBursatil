//
//  RepositoryVericarEmail.swift
//  Login
//
//  Created by Ronaldo Andre on 25/03/26.
//

import Foundation
import Combine

public class RepositoryVericarEmail {
    
    private let authService: AuthServiceVerificarEmail
    
    public init(authService: AuthServiceVerificarEmail) {
        self.authService = authService
    }
    
    public func verificarEmail(email: String) async throws -> String {
        let response = try await authService.fetchVerificarEmail(email: email)
        return response.detail
    }
    
    public func resendCode(email: String) async throws -> ResendVerificationResponse {
        return try await authService.resendVerification(email: email)
    }
    
    public func confirmCode(email: String, code: String) async throws -> ConfirmVerificationResponse {
        return try await authService.confirmVerification(email: email, code: code)
    }
}
