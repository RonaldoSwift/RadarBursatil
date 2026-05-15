//
//  RepositoryLoginProtocol.swift
//  Login
//
//  Created by Ronaldo Andre on 13/05/26.
//

import Foundation

public protocol RepositoryLoginProtocol {
    
    func login(
        email: String,
        password: String
    ) async throws -> LoginResponse
}
