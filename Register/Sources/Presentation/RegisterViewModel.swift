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
    
    init() {
        let service = AuthServiceRegister()
        self.repositoryRegister = RepositoryRegister(authServiceRegister: service)
    }
    
    func registerUser() {
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty else {
            self.message = "Complete todos los espacios"
            return
        }
        
        isLoading = true
        
        Task {
            do {
                let token = try await repositoryRegister.register(name: name, email: email, password: password)
                self.message = "Registro exitoso"
                self.isLoading = false
            } catch {
                self.message = error.localizedDescription
                self.isLoading = false
            }
        }
    }
}
