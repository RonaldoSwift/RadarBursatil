import Foundation

//No tinee codigo solo define las funciones 
public protocol SessionStorage {
    
    func saveIsLoggedIn(token: String)
    
    func isLoggedIn() -> Bool
    
    func logout()
}
