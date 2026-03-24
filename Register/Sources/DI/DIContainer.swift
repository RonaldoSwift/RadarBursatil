//
//  DIContainer.swift
//  Login
//
//  Created by Ronaldo Andre on 20/03/26.
//

import Foundation
import Swinject

let container: Container = {
    
    let container = Container()
    
    // Service
    container.register(AuthServiceRegister.self) { _ in
        AuthServiceRegister()
    }
    
    // Repository
    container.register(RepositoryRegister.self) { resolver in
        let service = resolver.resolve(AuthServiceRegister.self)!
        return RepositoryRegister(authServiceRegister: service)
    }
    
    // ViewModel
    container.register(RegisterViewModel.self) { resolver in
        let repo = resolver.resolve(RepositoryRegister.self)!
        return MainActor.assumeIsolated {
            RegisterViewModel(repositoryRegister: repo)
        }
    }
    
    return container
}()
