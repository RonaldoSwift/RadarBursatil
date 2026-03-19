//
//  RegisterViewModel.swift
//  Login
//
//  Created by Ronaldo Andre on 17/03/26.
//

import Foundation
import Combine
@MainActor

class RegisterViewModel: ObservableObject {
    
    private let repositoryRegister: RepositoryRegister
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published var message = ""
    @Published var isLoading = false
    @Published var showAlert = false
    
    init() {
        let service = AuthServiceRegister()
        self.repositoryRegister = RepositoryRegister(authServiceRegister: service)
    }
    
    func registerUser() {
        guard name.split(separator: " ").count >= 2,
              !email.isEmpty,
              !password.isEmpty else {
            
            self.message = "Ingresa nombre y apellido"
            self.showAlert = true
            return
        }
        
        isLoading = true
        
        Task {
            do {
                let message = try await repositoryRegister.register(
                    name: name,
                    email: email,
                    password: password
                )
                
                self.message = message
                self.showAlert = true
                self.isLoading = false
                
            } catch {
                if let apiError = error as? APIError {
                    self.message = apiError.errorDescription ?? "Error desconocido"
                } else {
                    self.message = error.localizedDescription
                }
                
                self.showAlert = true
                self.isLoading = false
            }
        }
    }
}
