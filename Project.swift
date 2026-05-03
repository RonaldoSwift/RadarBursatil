import ProjectDescription

let project = Project(
    name: "RadarBursatil",
    settings: .settings(
        configurations: [
            .debug(name: "Debug", xcconfig: .relativeToRoot("Configs/Config.xcconfig")),
            .release(name: "Release", xcconfig: .relativeToRoot("Configs/Config.xcconfig"))
        ]
    ),
    targets: [
        .target(
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
        ),
        .target(
            name: "Login",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.Login",
            infoPlist: .default,
            buildableFolders: [
                "Login/Sources",
                "Login/Resources"
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
                "Register/Sources",
                "Register/Resources"
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
                "VerificarEmail/Sources",
                "VerificarEmail/Resources"
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
                "Welcome/Sources",
                "Welcome/Resources"
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
                "Onboarding/Sources",
                "Onboarding/Resources"
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
                "RecuperarContrasena/Sources",
                "RecuperarContrasena/Resources"
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
                "CuentaCreada/Sources",
                "CuentaCreada/Resources"
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
                "NuevaContrasena/Sources",
                "NuevaContrasena/Resources"
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
                "ContrasenaActualizada/Sources",
                "ContrasenaActualizada/Resources"
            ],
            dependencies: [.external(name: "Swinject")
            ]
        ),
        .target(
            name: "RadarBursatilTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.RadarBursatilTests",
            infoPlist: .default,
            buildableFolders: [
                "RadarBursatil/Tests"
            ],
            dependencies: [.target(name: "RadarBursatil")]
        ),
    ],
)
