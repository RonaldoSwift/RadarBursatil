
import Foundation
import Combine

class RepositoryRegister {
    
    private let authServiceRegister: AuthServiceRegister
    
    init(authServiceRegister: AuthServiceRegister) {
        self.authServiceRegister = authServiceRegister
    }
    
    func register(
        name: String,
        email: String,
        password: String
    ) async throws -> String {
        
        let parts = name.split(separator: " ")
        
        let firstName = parts.first.map(String.init) ?? ""
        let lastName = parts.dropFirst().joined(separator: " ")
        
        let response = try await authServiceRegister.fetchRegister(
            email: email,
            first_name: firstName,
            last_name: lastName,
            middle_name: "",
            password: password,
            confirm_password: password
        )
        
        return response.message
    }
}
