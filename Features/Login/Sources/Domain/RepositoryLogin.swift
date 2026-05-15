//
//  Repository.swift
//  Login
//
//  Created by Ronaldo Andre on 16/03/26.
//

import Foundation
import Combine
import StorageKit

public final class RepositoryLogin: RepositoryLoginProtocol {
    
    private let authService: AuthService
    private let sessionStorage: SessionStorageProtocol
    
    init(
        authService: AuthService,
        sessionStorage: SessionStorageProtocol
    ) {
        self.authService = authService
        self.sessionStorage = sessionStorage
    }
    
    public func login(email: String, password: String) async throws -> LoginResponse {
        let response = try await authService.fetchLogin(
            email: email,
            password: password
        )
        sessionStorage.saveIsLoggedIn(token: response.accessToken)
        return response
    }
}
