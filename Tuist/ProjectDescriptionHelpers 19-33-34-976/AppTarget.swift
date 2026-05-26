//
//  AppTarget.swift
//  ContrasenaActualizada
//
//  Created by Ronaldo Andre on 5/05/26.
//

import ProjectDescription

public func appTarget() -> Target {

    return .target(
            name: "RadarBursatil",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.RadarBursatil",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                    "BASE_URL": "$(BASE_URL)"
                ]
            ),
            buildableFolders: [
                "RadarBursatil/Sources",
                "RadarBursatil/Resources"
            ],
            dependencies: [
                .target(name: "Login"),
                .target(name: "Register"),
                .target(name: "VerificarEmail"),
                .target(name: "Welcome"),
                .target(name: "Onboarding"),
                .target(name: "RecuperarContrasena"),
                .target(name: "CuentaCreada"),
                .target(name: "NuevaContrasena"),
                .target(name: "ContrasenaActualizada")
            ]
        )
}