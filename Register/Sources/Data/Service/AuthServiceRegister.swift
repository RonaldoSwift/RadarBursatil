import Foundation

class AuthServiceRegister {
    
    func fetchRegister(
        email: String,
        first_name: String,
        last_name: String,
        middle_name: String,
        password: String,
        confirm_password: String
    ) async throws -> RegisterResponse {
        
        let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
        
        guard let url = URL(string: "\(baseURL)/api/v1/auth/register") else {
            throw URLError(.badURL)
        }
        
        // Body
        let body = RegisterRequest(
            email: email,
            firstName: first_name,
            lastName: last_name,
            middleName: middle_name,
            password: password,
            confirmPassword: confirm_password
        )
        
        // Request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(body)
        
        // Call API
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        // Validación de status
        if !(200...299).contains(httpResponse.statusCode) {
            
            let raw = String(data: data, encoding: .utf8) ?? "Error desconocido"
            
            if raw.contains("detail") {
                let detail = raw
                    .replacingOccurrences(of: "{\"detail\":\"", with: "")
                    .replacingOccurrences(of: "\"}", with: "")
                
                throw APIError.custom(detail)
            } else {
                throw APIError.custom(raw)
            }
        }
        
        // Decode
        return try JSONDecoder().decode(RegisterResponse.self, from: data)
    }
    
    func sendVerificationEmail(email: String) async throws -> EmailVerificationResponse {
        
        let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""

        guard let url = URL(string: "\(baseURL)/api/v1/auth/register") else {
            throw URLError(.badURL)
        }
        
        let body = ["email": email]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        try validateResponse(data: data, response: response)
        
        return try JSONDecoder().decode(EmailVerificationResponse.self, from: data)
    }
    
    
    private func validateResponse(data: Data, response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        if !(200...299).contains(httpResponse.statusCode) {
            let raw = String(data: data, encoding: .utf8) ?? "Error desconocido"
            throw APIError.custom(raw)
        }
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
