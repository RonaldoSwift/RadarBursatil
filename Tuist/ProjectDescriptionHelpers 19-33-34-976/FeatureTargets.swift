//
//  FeatureTargets.swift
//  ContrasenaActualizada
//
//  Created by Ronaldo Andre on 5/05/26.
//

import ProjectDescription

public func featureTargets() -> [Target] {
    return [
        .target(
            name: "Login",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Login",
            infoPlist: .default,
            buildableFolders: [
                "Features/Login/Sources",
                "Features/Login/Resources"
            ],
            dependencies: [
                .external(name: "Swinject")
            ]
        ),
        .target(
            name: "Register",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Register",
            infoPlist: .default,
            buildableFolders: [
                "Features/Register/Sources",
                "Features/Register/Resources"
            ],
            dependencies: [
                .external(name: "Swinject")
            ]
        ),
        .target(
            name: "VerificarEmail",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.VerificarEmail",
            infoPlist: .default,
            buildableFolders: [
                "Features/VerificarEmail/Sources",
                "Features/VerificarEmail/Resources"
            ],
            dependencies: [
                .external(name: "Swinject")
            ]
        ),
        .target(
            name: "Welcome",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Welcome",
            infoPlist: .default,
            buildableFolders: [
                "Features/Welcome/Sources",
                "Features/Welcome/Resources"
            ],
            dependencies: [
                .external(name: "Swinject")
            ]
        ),
        .target(
            name: "Onboarding",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Onboarding",
            infoPlist: .default,
            buildableFolders: [
                "Features/Onboarding/Sources",
                "Features/Onboarding/Resources"
            ],
            dependencies: [
                .external(name: "Swinject")
            ]
        ),
        .target(
            name: "RecuperarContrasena",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.RecuperarContrasena",
            infoPlist: .default,
            buildableFolders: [
                "Features/RecuperarContrasena/Sources",
                "Features/RecuperarContrasena/Resources"
            ],
            dependencies: [
                .external(name: "Swinject")
            ]
        ),
        .target(
            name: "CuentaCreada",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.CuentaCreada",
            infoPlist: .default,
            buildableFolders: [
                "Features/CuentaCreada/Sources",
                "Features/CuentaCreada/Resources"
            ],
            dependencies: [.external(name: "Swinject")
            ]
        ),
        .target(
            name: "NuevaContrasena",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.NuevaContrasena",
            infoPlist: .default,
            buildableFolders: [
                "Features/NuevaContrasena/Sources",
                "Features/NuevaContrasena/Resources"
            ],
            dependencies: [.external(name: "Swinject")
            ]
        ),
        .target(
            name: "ContrasenaActualizada",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.ContrasenaActualizada",
            infoPlist: .default,
            buildableFolders: [
                "Features/ContrasenaActualizada/Sources",
                "Features/ContrasenaActualizada/Resources"
            ],
            dependencies: [.external(name: "Swinject")
            ]
        )
    ]
}
