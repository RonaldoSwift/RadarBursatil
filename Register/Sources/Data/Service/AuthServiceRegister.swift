
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
        
        // 🔥 AQUÍ ESTÁ LA MAGIA
        if !(200...299).contains(httpResponse.statusCode) {
            
            // Intentamos leer el error del backend
            if let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                throw NSError(
                    domain: "",
                    code: httpResponse.statusCode,
                    userInfo: [NSLocalizedDescriptionKey: errorResponse.detail]
                )
            } else {
                throw URLError(.badServerResponse)
            }
        }
        
        return try JSONDecoder().decode(RegisterResponse.self, from: data)
    }
}
