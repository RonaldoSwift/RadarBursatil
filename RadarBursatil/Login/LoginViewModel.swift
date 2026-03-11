//
//  LoginViewModel.swift
//  RadarBursatil
//
//  Created by Ronaldo Andre on 11/03/26.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    func loginUser(email: String, password: String) {
        
        AuthService.shared.login(email: email, password: password) { result in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let response):
                    
                    print("Access Token:", response.access_token)
                    
                case .failure(let error):
                    
                    print("Error:", error.localizedDescription)
                }
            }
        }
    }
}
