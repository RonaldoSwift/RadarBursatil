//
//  Repository.swift
//  Login
//
//  Created by Ronaldo Andre on 16/03/26.
//

import Foundation
import Combine

public class RepositoryLogin {
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func login(email: String, password: String) async throws -> LoginResponse {
        return try await authService.fetchLogin(email: email, password: password)
    }
}
