import SwiftUI
import Login
import Register
import VerificarEmail
import Swinject
import Welcome
import StorageKit

@main
struct RadarBursatilApp: App {
    
    @StateObject private var appRootManager = AppRootManager()
    private let sessionStorage: SessionStorage = SessionStorageImpl()
    
    let container: Container = {
        let assembler = Assembler([
            LoginAssembly(),
            RegisterAssembly(),
            VerificarEmailAssembly()
        ])
        return assembler.resolver as! Container
    }()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .authentication:
                    AuthenticationRootView(
                        loginViewModel: container.resolve(LoginViewModel.self)!,
                        registerViewModel: container.resolve(RegisterViewModel.self)!,
                        verificarEmailViewModel: container.resolve(VerificarEmailViewModel.self)!
                    )
                    .environmentObject(appRootManager)
                    
                case .principal:
                    PrincipalRootView()
                        .environmentObject(appRootManager)
                }
            }
            .onAppear {
                if sessionStorage.isLoggedIn() {
                    appRootManager.currentRoot = .principal
                } else {
                    appRootManager.currentRoot = .authentication
                }
            }
        }
    }
}
