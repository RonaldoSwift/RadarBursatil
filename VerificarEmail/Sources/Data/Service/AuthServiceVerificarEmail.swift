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
    
    func resendVerification(email: String) async throws -> ResendVerificationResponse {
        
        let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
        
        guard let url = URL(string: "\(baseURL)/api/v1/auth/email-verification/resend") else {
            throw URLError(.badURL)
        }
        
        let body = ["email": email]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        if !(200...299).contains(httpResponse.statusCode) {
            let raw = String(data: data, encoding: .utf8) ?? "Error desconocido"
            throw APIError.custom(raw)
        }
        
        return try JSONDecoder().decode(ResendVerificationResponse.self, from: data)
    }
    
    func confirmVerification(email: String, code: String) async throws -> ConfirmVerificationResponse {
        
        let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
        
        guard let url = URL(string: "\(baseURL)/api/v1/auth/email-verification/confirm") else {
            throw URLError(.badURL)
        }
        
        let body: [String: String] = [
            "email": email,
            "verification_code": code
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        if !(200...299).contains(httpResponse.statusCode) {
            let raw = String(data: data, encoding: .utf8) ?? "Error desconocido"
            throw APIError.custom(raw)
        }
        
        return try JSONDecoder().decode(ConfirmVerificationResponse.self, from: data)
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
