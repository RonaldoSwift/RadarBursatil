//
//  MockRepositoryLogin.swift
//  ContrasenaActualizada
//
//  Created by Ronaldo Andre on 14/05/26.
//

import Foundation

final class MockRepositoryLogin: RepositoryLoginProtocol {
    
    func login(
        email: String,
        password: String
    ) async throws -> LoginResponse {
        
        return LoginResponse(
            accessToken: "mock_token",
            refreshToken: "mock_refresh",
            tokenType: "Bearer",
            expiresIn: 3600,
            user: User(
                userId: "1",
                email: "test@test.com",
                firstName: "Ronaldo",
                lastName: "Vargas",
                profilePicture: nil
            )
        )
    }
}
