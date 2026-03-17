//
//  AuthService.swift
//  RadarBursatil
//
//  Created by Ronaldo Andre on 2/03/26.
//


import Foundation

class AuthService {
    
    func fetchLogin(email: String, password: String) async throws -> LoginResponse {
        
        guard let url = URL(string: "https://api.radarbursatil.com/api/v1/auth/login") else {
            throw URLError(.badURL)
        }
        
        let body = LoginRequest(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard 200...299 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(LoginResponse.self, from: data)
    }
}
