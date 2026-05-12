import Foundation

public protocol SessionStorage {
    
    func saveSession(token: String)
    
    func isLoggedIn() -> Bool
    
    func logout()
}
