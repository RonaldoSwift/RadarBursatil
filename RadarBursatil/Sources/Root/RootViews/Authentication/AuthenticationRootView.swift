import Foundation
import Login
import SwiftUI
import Register

struct AuthenticationRootView: View {
    
    @State var isActiveLogin: Bool = false
    @State var isActiveRegister: Bool = false
    @State var isActiveVerificarEmail: Bool = false
    
    var body: some View {
        NavigationView {
            LoginView(
                viewModel: <#T##LoginViewModel#>,
                onClickRegister: isActiveRegister = true
            )
            .navigation(RegisterView(viewModel: <#RegisterViewModel#>), $isActiveRegister)
        }
    }
}
