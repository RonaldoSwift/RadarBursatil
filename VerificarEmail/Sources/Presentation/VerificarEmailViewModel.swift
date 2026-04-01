//
//  VerificarEmailViewModel.swift
//  Login
//
//  Created by Ronaldo Andre on 25/03/26.
//

import Foundation
import Combine
import Swinject
@MainActor

class VerificarEmailViewModel: ObservableObject {
    
    private let repositoryVericarEmail: RepositoryVericarEmail
    
    @Published var email: String = ""
    
    @Published var message = ""
    @Published var isLoading = false
    @Published var showAlert = false
    
    init(repositoryVericarEmail: RepositoryVericarEmail) {
        self.repositoryVericarEmail = repositoryVericarEmail
    }
    
    func registerEmailVerificar(){
        guard !email.isEmpty else {
            self.message = "Ingrese los 6 digitos"
            self.showAlert = true
            return
        }
        
        isLoading = true
        
        Task {
            do {
                let message = try await repositoryVericarEmail.verificarEmail(email: email)
                
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
