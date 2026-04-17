//
//  LoginViewModel.swift
//  RadarBursatil
//
//  Created by Ronaldo Andre on 11/03/26.
//

import Foundation
import Combine

@MainActor
public class LoginViewModel: ObservableObject {
    
    private let repository: AuthRepository
    
    @Published public var email: String = ""
    @Published public var password: String = ""
    
    public init(repository: AuthRepository) {
        self.repository = repository
    }
    
    public func loginUser() {
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
