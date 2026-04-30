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

public class RegisterViewModel: ObservableObject {
    
    private let repositoryRegister: RepositoryRegister
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var isSuccess = false
    
    @Published var message = ""
    @Published var isLoading = false
    @Published var showAlert = false
    
    init(repositoryRegister: RepositoryRegister) {
        self.repositoryRegister = repositoryRegister
    }
    
    func registerUser() {
        isSuccess = false
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
                _ = try await repositoryRegister.register(
                    name: name,
                    email: email,
                    password: password
                )
                
                try await repositoryRegister.sendVerification(email: email)
                
                self.message = "Te enviamos un código a tu correo"
                self.showAlert = true
                self.isSuccess = true
                self.isLoading = false
                
            } catch {
                let errorMessage = error.localizedDescription
                
                if errorMessage.contains("USER_NOT_VERIFIED") {
                    
                    try? await repositoryRegister.sendVerification(email: email)
                    
                    self.message = "Ya tienes cuenta. Te reenviamos el código."
                    self.isSuccess = true
                    self.showAlert = true
                    
                } else {
                    self.message = errorMessage
                    self.showAlert = true
                }
                
                self.isLoading = false
            }
        }
    }
}
