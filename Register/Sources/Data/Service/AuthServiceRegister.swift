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
        
        let rawBase = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""

        let trimmed = rawBase.trimmingCharacters(in: .whitespacesAndNewlines)
        
        var scheme = "https"
        var remainder = trimmed
        if remainder.hasPrefix("https://") {
            scheme = "https"
            remainder = String(remainder.dropFirst("https://".count))
        } else if remainder.hasPrefix("http://") {
            scheme = "http"
            remainder = String(remainder.dropFirst("http://".count))
        } else if remainder.hasPrefix("https:") {
            scheme = "https"
            remainder = String(remainder.dropFirst("https:".count))
        } else if remainder.hasPrefix("http:") {
            scheme = "http"
            remainder = String(remainder.dropFirst("http:".count))
        }
        
        // Remove any leading or trailing slashes
        while remainder.hasPrefix("/") { remainder.removeFirst() }
        while remainder.hasSuffix("/") { remainder.removeLast() }

        // If remainder empty, the BASE_URL is malformed (e.g. just "https:")
        guard !remainder.isEmpty else {
            // Mensaje claro para debugging
            print("Error: configuración 'BASE_URL' inválida. Valor leído:", rawBase)
            throw APIError.custom("La configuración del servidor (BASE_URL) es inválida: '\(rawBase)'. Revisa 'Configs/Config.xcconfig' y asegúrate de usar solo el host (por ejemplo: 'api.radarbursatil.com') o una URL completa con esquema (por ejemplo: 'https://api.radarbursatil.com').")
        }

        // remainder might include a path (e.g. example.com/api). Split host and basePath
        let parts = remainder.split(separator: "/", maxSplits: 1, omittingEmptySubsequences: false)
        let host = String(parts.first ?? "")
        let basePathSuffix: String
        if parts.count > 1 {
            basePathSuffix = "/\(parts[1])"
        } else {
            basePathSuffix = ""
        }

        // Build final components
        var components = URLComponents()
        components.scheme = scheme
        components.host = host

        // Combine any base path from BASE_URL with the API path
        // Ensure there is exactly one slash between segments
        let apiPath = "/api/v1/auth/register"
        if basePathSuffix.isEmpty {
            components.path = apiPath
        } else {
            // basePathSuffix already starts with '/'
            // Avoid double slashes: strip trailing slash from basePathSuffix if apiPath will add one
            var cleanedBase = basePathSuffix
            while cleanedBase.hasSuffix("/") { cleanedBase.removeLast() }
            components.path = cleanedBase + apiPath
        }

        guard let finalURL = components.url else {
            print("Error: no se pudo construir la URL final. BASE_URL leída:", rawBase, " Host saneado:", host)
            throw URLError(.badURL)
        }

        // Mensajes más claros para la consola
        print("BASE_URL (configuración leída):", rawBase)
        print("Host detectado:", host)
        print("Esquema usado:", scheme)
        print("URL completa de la petición:", finalURL.absoluteString)
        
        let body = RegisterRequest(
            email: email,
            firstName: first_name,
            lastName: last_name,
            middleName: middle_name,
            password: password,
            confirmPassword: confirm_password
        )
        
        var request = URLRequest(url: finalURL)
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
