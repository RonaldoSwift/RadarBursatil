//
//  Repository.swift
//  Login
//
//  Created by Ronaldo Andre on 16/03/26.
//

import Foundation
import Combine

class AuthRepository {
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func login(email: String, password: String) async throws -> String {
        
        let response = try await authService.fetchLogin(email: email, password: password)
        
        return response.access_token
    }
}
