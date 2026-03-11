//
//  AuthService.swift
//  RadarBursatil
//
//  Created by Ronaldo Andre on 2/03/26.
//

import Foundation

class AuthService {
    
    static let shared = AuthService()
    
    func registerUser(requestBody: LoginRequest,
                      completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        
        guard let url = URL(string: "http://localhost:8000/api/v1/auth/register") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(requestBody)
        } catch {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoded = try JSONDecoder().decode(LoginResponse.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
