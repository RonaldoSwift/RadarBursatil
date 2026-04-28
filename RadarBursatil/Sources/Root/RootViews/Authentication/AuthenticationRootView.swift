import Foundation
import Login
import SwiftUI
import Register
import VerificarEmail
import Welcome

struct AuthenticationRootView: View {
    
    @State var isActiveLogin: Bool = false
    @State var isActiveRegister: Bool = false
    @State var isActiveWelcome: Bool = true
    @State var isActiveVerificarEmail: Bool = false
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
            .navigation(LoginView(viewModel: loginViewModel, onClickRegister: {isActiveRegister = true}), $isActiveLogin)
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
                VerificarEmailView(email: email, viewModel: verificarEmailViewModel),
                $isActiveVerificarEmail
            )
        }
        
        /*LoginView(
         viewModel: loginViewModel,
         onClickRegister: {isActiveRegister = true}
         )
         .navigation(RegisterView(viewModel: registerViewModel), $isActiveRegister)*/
    }
}
