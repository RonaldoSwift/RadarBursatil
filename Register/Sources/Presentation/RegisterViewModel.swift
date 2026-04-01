//
//  RegisterViewModel.swift
//  Login
//
//  Created by Ronaldo Andre on 17/03/26.
//

import Foundation
import Combine
import Swinject
@MainActor

class RegisterViewModel: ObservableObject {
    
    private let repositoryRegister: RepositoryRegister
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var goToVerifyEmail = false
    
    @Published var message = ""
    @Published var isLoading = false
    @Published var showAlert = false
    
    init(repositoryRegister: RepositoryRegister) {
        self.repositoryRegister = repositoryRegister
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
                self.goToVerifyEmail = true
                self.isLoading = false
                
            } catch {
                self.message = error.localizedDescription
                self.showAlert = true
                self.isLoading = false
            }
        }
    }
}
