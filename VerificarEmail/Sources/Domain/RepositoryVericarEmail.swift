//
//  RepositoryVericarEmail.swift
//  Login
//
//  Created by Ronaldo Andre on 25/03/26.
//

import Foundation
import Combine

class RepositoryVericarEmail {
    
    private let AuthServiceVerificarEmail: AuthServiceVerificarEmail
    
    init(AuthServiceVerificarEmail: AuthServiceVerificarEmail) {
        self.AuthServiceVerificarEmail = AuthServiceVerificarEmail
    }
    
    func verificarEmail(email: String) async throws -> String {
        let parts = email.split(separator: " ")
        let firstName = parts.first.map(String.init) ?? ""
        let lastName = parts.dropFirst().joined(separator: " ")
        
        let response = try await AuthServiceVerificarEmail.fetchVerificarEmail(
            email: email
        )
        return response.detail
    }
}
