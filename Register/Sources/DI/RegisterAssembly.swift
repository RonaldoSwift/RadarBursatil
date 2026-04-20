//
//  DIContainer.swift
//  Login
//
//  Created by Ronaldo Andre on 20/03/26.
//

import Swinject

public final class RegisterAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        
        container.register(AuthServiceRegister.self) { _ in
            AuthServiceRegister()
        }
        
        container.register(RepositoryRegister.self) { r in
            RepositoryRegister(
                authServiceRegister: r.resolve(AuthServiceRegister.self)!
            )
        }
        
        container.register(RegisterViewModel.self) { r in
            MainActor.assumeIsolated {
                RegisterViewModel(
                    repositoryRegister: r.resolve(RepositoryRegister.self)!
                )
            }
        }
    }
}
