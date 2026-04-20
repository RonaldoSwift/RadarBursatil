//
//  AuthServiceVerificarEmail.swift
//  Login
//
//  Created by Ronaldo Andre on 25/03/26.
//

import Foundation

public class AuthServiceVerificarEmail {
    
    func fetchVerificarEmail(email: String) async throws -> VerificarEmailResponse {
        
        let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
        
        guard let url = URL(string: "\(baseURL)/api/v1/auth/email-verification/send") else {
            throw URLError(.badURL)
        }
        
        let body = VerificarEmailRequest(email: email)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        if (200..<300).contains(httpResponse.statusCode) == false {
            let raw = String(data: data, encoding: .utf8) ?? "Error desconocido"
            
            if raw.contains("detail") {
                let detail = raw .replacingOccurrences(of: "{\"detail\":\"", with: "")
                    .replacingOccurrences(of: "\"}", with: "")
                throw APIError.custom(detail)
            } else {
                throw APIError.custom(raw)
            }
        }
        
        return try JSONDecoder().decode(VerificarEmailResponse.self, from: data)
    }
}

enum APIError: LocalizedError {
    case custom(String)
    
    var errorDescription: String? {
        switch self {
        case .custom(let message):
            return message
        }
    }
}
