import Foundation

// Esta no debe ser publica y e implementa las funciones del protocolo
public class SessionStorageImpl: SessionStorage {
    
    private let tokenKey = "user_token"
    
    public init() {}
    
    // Conform to `SessionStorage` protocol
    public func saveIsLoggedIn(token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    public func isLoggedIn() -> Bool {
        return UserDefaults.standard.string(forKey: tokenKey) != nil
    }
    
    public func logout() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
}
