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
                .target(name: "VerificarEmail")
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
            dependencies: []
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
