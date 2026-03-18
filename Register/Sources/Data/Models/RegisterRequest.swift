
import Foundation

struct RegisterRequest: Codable {
    var email: String
    var first_name: String
    var last_name: String
    var middle_name: String
    var password: String
    var confirm_password: String
}
