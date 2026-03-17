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
    
    func login(email: String, password: String) -> AnyPublisher<String, Error> {
        
        return authService
            .fetchLogin(email: email, password: password)
            .map { (loginResponse: LoginResponse) in
                
                loginResponse.access_token
                
            }
            .eraseToAnyPublisher()
    }
}
