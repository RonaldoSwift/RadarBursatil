//
//  LoginAssembly.swift
//  Login
//
//  Created by Ronaldo Andre on 16/04/26.
//

import Foundation
import Swinject
import StorageKit

public final class LoginAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        
        container.register(AuthService.self) { _ in
            AuthService()
        }
        
        container.register(SessionStorage.self) { _ in
            SessionStorageFactory.make()
        }
        
        container.register(RepositoryLoginProtocol.self) { r in
            RepositoryLogin(
                authService: r.resolve(AuthService.self)!,
                sessionStorage: r.resolve(SessionStorage.self)!
            )
        }
        
        container.register(LoginViewModel.self) { r in
            MainActor.assumeIsolated {
                LoginViewModel(
                    repository: r.resolve(RepositoryLoginProtocol.self)!
                )
            }
        }
    }
}
