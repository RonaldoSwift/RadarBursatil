//
//  LoginViewModel.swift
//  RadarBursatil
//
//  Created by Ronaldo Andre on 11/03/26.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    private let repository: AuthRepository
    
    init() {
        let service = AuthService()
        self.repository = AuthRepository(authService: service)
    }
    
    func loginUser(email: String, password: String) {
        
        Task {
            do {
                let token = try await repository.login(email: email, password: password)
                print("Token: \(token)")
            } catch {
                print("Login failed: \(error.localizedDescription)")
            }
        }
    }
}
