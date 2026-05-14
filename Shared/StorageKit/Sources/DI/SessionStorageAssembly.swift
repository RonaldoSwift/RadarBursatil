//
//  SessionStorageAssembly.swift
//  DI
//
//  Created by automated edit
//

import Foundation
import Swinject

// el assembly es injectar 
public final class SessionStorageAssembly: Assembly {
    public init() {}

    public func assemble(container: Container) {
        container.register(SessionStorageProtocol.self) { _ in
            SessionStorageImpl()
        }
    }
}
