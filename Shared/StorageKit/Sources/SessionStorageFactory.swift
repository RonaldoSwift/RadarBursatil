//
//  SessionStorageFactory.swift
//  ContrasenaActualizada
//
//  Created by Ronaldo Andre on 14/05/26.
//

import Foundation

public enum SessionStorageFactory {
    
    public static func make() -> SessionStorage {
        SessionStorageImpl()
    }
}
