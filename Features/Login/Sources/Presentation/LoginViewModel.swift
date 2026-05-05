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
    
    private let repository: RepositoryLogin
    
    @Published public var email: String = ""
    @Published public var password: String = ""
    
    @Published var isLoading = false
    @Published var isSuccess = false
    @Published var message = ""
    @Published var showAlert = false
    
    public init(repository: RepositoryLogin) {
        self.repository = repository
    }
    
    public func loginUser() {
        isLoading = true
        
        Task {
            do {
                let response = try await repository.login(email: email, password: password)
                
                print("Token: \(response.accessToken)")
                
                self.isSuccess = true
                self.isLoading = false
                
            } catch {
                self.message = error.localizedDescription
                self.showAlert = true
                self.isLoading = false
            }
        }
    }
}
