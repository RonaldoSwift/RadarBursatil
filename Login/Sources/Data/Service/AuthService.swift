//
//  AuthService.swift
//  RadarBursatil
//
//  Created by Ronaldo Andre on 2/03/26.
//


import Foundation
import Combine

class AuthService {
    
    func fetchLogin(email: String, password: String) -> AnyPublisher<LoginResponse, Error> {
        
        guard let url = URL(string: "https://api.radarbursatil.com/api/v1/auth/login") else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        let body = LoginRequest(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(body)
        } catch {
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { data, response in
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                
                guard 200...299 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: LoginResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
