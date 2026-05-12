import Foundation

public final class SessionStorageImpl: SessionStorage {
    
    private let tokenKey = "user_token"
    
    public init() {}
    
    public func saveSession(token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    public func isLoggedIn() -> Bool {
        return UserDefaults.standard.string(forKey: tokenKey) != nil
    }
    
    public func logout() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
}
