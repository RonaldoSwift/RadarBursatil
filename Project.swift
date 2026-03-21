import ProjectDescription

let project = Project(
    name: "RadarBursatil",
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
                ]
            ),
            buildableFolders: [
                "RadarBursatil/Sources",
                "RadarBursatil/Resources"
            ],
            dependencies: [
                .target(name: "Login"),
                .target(name: "Register")
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
    ]
)
