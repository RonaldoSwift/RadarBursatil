//
//  LoginAssembly.swift
//  Login
//
//  Created by Ronaldo Andre on 16/04/26.
//

import Foundation
import Swinject

public final class LoginAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        
        container.register(AuthService.self) { _ in
            AuthService()
        }
        
        container.register(RepositoryLogin.self) { r in
            RepositoryLogin(
                authService: r.resolve(AuthService.self)!
            )
        }
        
        container.register(LoginViewModel.self) { r in
            MainActor.assumeIsolated {
                LoginViewModel(
                    repository: r.resolve(RepositoryLogin.self)!
                )
            }
        }
    }
}
