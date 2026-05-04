
import Foundation

struct RegisterRequest: Codable {
    let email: String
    let firstName: String
    let lastName: String
    let middleName: String
    let password: String
    let confirmPassword: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case middleName = "middle_name"
        case password
        case confirmPassword = "confirm_password"
    }
}
