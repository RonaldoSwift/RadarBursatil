
import Foundation
import Combine

class RepositoryRegister {
    
    private let authServiceRegister: AuthServiceRegister
    
    init(authServiceRegister: AuthServiceRegister) {
        self.authServiceRegister = authServiceRegister
    }
    
    func register(
        email: String,
        first_name: String,
        last_name: String,
        middle_name: String,
        password: String,
        confirm_password: String
    ) async throws -> String {
        
        let response = try await authServiceRegister.fetchRegister(
            email: email,
            first_name: first_name,
            last_name: last_name,
            middle_name: middle_name,
            password: password,
            confirm_password: confirm_password
        )
        
        return response.detail
    }
}
