//
//  VerificarEmailAssembly.swift
//  Login
//
//  Created by Ronaldo Andre on 25/03/26.
//

import Foundation
import Swinject

public final class VerificarEmailAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        
        container.register(AuthServiceVerificarEmail.self) { _ in
            AuthServiceVerificarEmail()
        }
        
        container.register(RepositoryVericarEmail.self) { r in
            RepositoryVericarEmail(
                authService: r.resolve(AuthServiceVerificarEmail.self)!
            )
        }
        
        container.register(VerificarEmailViewModel.self) { r in
            MainActor.assumeIsolated {
                VerificarEmailViewModel(
                    repositoryVericarEmail: r.resolve(RepositoryVericarEmail.self)!
                )
            }
        }
    }
}
