import SwiftUI
import Login
import Register
import VerificarEmail
import Swinject
import Welcome

@main
struct RadarBursatilApp: App {

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
            AuthenticationRootView(
                loginViewModel: container.resolve(LoginViewModel.self)!,
                registerViewModel: container.resolve(RegisterViewModel.self)!,
                verificarEmailViewModel: container.resolve(VerificarEmailViewModel.self)!
            )
        }
    }
}
