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
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        let service = AuthService()
        self.repository = AuthRepository(authService: service)
    }
    
    func loginUser(email: String, password: String) {
        
        repository
            .login(email: email, password: password)
            .sink(
                receiveCompletion: { completion in
                    
                    switch completion {
                    
                    case .failure(let error):
                        print("Error:", error.localizedDescription)
                        
                    case .finished:
                        break
                    }
                },
                receiveValue: { token in
                    print("Access Token:", token)
                }
            )
            .store(in: &cancellables)
    }
}
