import Foundation
import Login
import SwiftUI
import Register

struct AuthenticationRootView: View {
    
    @State var isActiveLogin: Bool = false
    @State var isActiveRegister: Bool = false
    @State var isActiveVerificarEmail: Bool = false
    
    var loginViewModel: LoginViewModel
    var registerViewModel: RegisterViewModel
    
    public init(loginViewModel: LoginViewModel, registerViewModel: RegisterViewModel) {
        self.loginViewModel = loginViewModel
        self.registerViewModel = registerViewModel
    }
    
    var body: some View {
        NavigationView {
            LoginView(
                viewModel: loginViewModel,
                onClickRegister: {isActiveRegister = true}
            )
            .navigation(RegisterView(viewModel: registerViewModel), $isActiveRegister)
        }
    }
}
