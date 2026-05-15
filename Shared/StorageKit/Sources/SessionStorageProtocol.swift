import Foundation

//No tinee codigo solo define las funciones 
public protocol SessionStorageProtocol {
    
    func saveIsLoggedIn(token: String)
    
    func isLoggedIn() -> Bool
    
    func logout()
}
