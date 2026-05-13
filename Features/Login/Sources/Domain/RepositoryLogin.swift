//
//  Repository.swift
//  Login
//
//  Created by Ronaldo Andre on 16/03/26.
//

import Foundation
import Combine
import StorageKit

public class RepositoryLogin {
    
    private let authService: AuthService
    private let sessionStorage: SessionStorage
    
    init(
        authService: AuthService,
        sessionStorage: SessionStorage
    ) {
        self.authService = authService
        self.sessionStorage = sessionStorage
    }
    
    func login(email: String, password: String) async throws -> LoginResponse {
        let response = try await authService.fetchLogin(
            email: email,
            password: password
        )
        sessionStorage.saveIsLoggedIn(token: response.accessToken)
        return response
    }
}
