//
//  RegisterViewModel.swift
//  Login
//
//  Created by Ronaldo Andre on 17/03/26.
//

import Foundation
import Combine

class RegisterViewModel: ObservableObject {
    
    private let repositoryRegister: RepositoryRegister
    
    init() {
        let service = AuthServiceRegister()
        self.repositoryRegister = RepositoryRegister(authServiceRegister: service)
    }
    
    func registerUser() {
        Task {
            do {
                let token = try await repositoryRegister.register
                print("Token: \(String(describing: token))")
            } catch {
                print("Login failed: \(error.localizedDescription)")
            }
        }
    }
}
