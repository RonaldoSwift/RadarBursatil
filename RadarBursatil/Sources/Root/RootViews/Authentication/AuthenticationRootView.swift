import Foundation
import Login
import SwiftUI
import Register
import Welcome

struct AuthenticationRootView: View {
    
    @State var isActiveLogin: Bool = false
    @State var isActiveRegister: Bool = false
    @State var isActiveWelcome: Bool = true
    
    var loginViewModel: LoginViewModel
    var registerViewModel: RegisterViewModel
    
    public init(loginViewModel: LoginViewModel, registerViewModel: RegisterViewModel) {
        self.loginViewModel = loginViewModel
        self.registerViewModel = registerViewModel
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
            .navigation(RegisterView(viewModel: registerViewModel), $isActiveRegister)
    }
             
            /*LoginView(
                viewModel: loginViewModel,
                onClickRegister: {isActiveRegister = true}
            )
            .navigation(RegisterView(viewModel: registerViewModel), $isActiveRegister)*/
        }
    }
