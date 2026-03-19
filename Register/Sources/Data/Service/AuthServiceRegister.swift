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
        
        guard let url = URL(string: "https://api.radarbursatil.com/api/v1/auth/register") else {
            throw URLError(.badURL)
        }
        
        let body = RegisterRequest(
            email: email,
            first_name: first_name,
            last_name: last_name,
            middle_name: middle_name,
            password: password,
            confirm_password: confirm_password
        )
        
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
            
            if raw.contains("detail") {
                let detail = raw
                    .replacingOccurrences(of: "{\"detail\":\"", with: "")
                    .replacingOccurrences(of: "\"}", with: "")
                
                throw APIError.custom(detail)
            } else {
                throw APIError.custom(raw)
            }
        }
        
        return try JSONDecoder().decode(RegisterResponse.self, from: data)
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
