import Foundation
import Login
import SwiftUI
import Register
import VerificarEmail
import RecuperarContrasena
import CuentaCreada
import Welcome

struct AuthenticationRootView: View {
    
    //Injectamos el AppRootManager para poder cambiar la raíz de la aplicación una vez que el usuario se autentique correctamente.
    @EnvironmentObject var appRootManager: AppRootManager
    
    @State var isActiveLogin: Bool = false
    @State var isActiveRegister: Bool = false
    @State var isActiveWelcome: Bool = true
    @State var isActiveVerificarEmail: Bool = false
    @State var isActiveRecuperar: Bool = false
    @State var isActiveCuentaCreada: Bool = false
    @State var email: String = ""
    
    var loginViewModel: LoginViewModel
    var registerViewModel: RegisterViewModel
    var verificarEmailViewModel: VerificarEmailViewModel
    
    public init(
        loginViewModel: LoginViewModel,
        registerViewModel: RegisterViewModel,
        verificarEmailViewModel: VerificarEmailViewModel
    ) {
        self.loginViewModel = loginViewModel
        self.registerViewModel = registerViewModel
        self.verificarEmailViewModel = verificarEmailViewModel
    }
    
    var body: some View {
        NavigationView {
            WelcomeView(
                onLogin: {
                    isActiveLogin = true
                },
                onRegister: {
                    isActiveRegister = true
                }
            )
            .navigation(
                LoginView(viewModel: loginViewModel,
                          onClickRegister: {isActiveRegister = true},
                          onForgotPassword: {isActiveRecuperar = true},
                          onLoginSuccess: {
                              DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                  appRootManager.currentRoot = .principal
                              }
                          }
                         ),
                $isActiveLogin
            )
            .navigation(
                RegisterView(
                    viewModel: registerViewModel,
                    onRegisterSuccess: { email in
                        self.email = email
                        isActiveVerificarEmail = true
                    }
                ),
                $isActiveRegister
            )
            .navigation(
                VerificarEmailView(
                    email: email,
                    viewModel: verificarEmailViewModel,
                    onSuccess: {
                        isActiveCuentaCreada = true
                    }
                ),
                $isActiveVerificarEmail
            )
            .navigation(RecuperarContrasenaView(), $isActiveRecuperar)
            .navigation(CuentaCreadaView(onContinue: {
                //Cambiamos la raíz de la aplicación a la pantalla principal una vez que el usuario se autentique correctamente.
                appRootManager.currentRoot = .principal
            }), $isActiveCuentaCreada
            )
        }
    }
}
