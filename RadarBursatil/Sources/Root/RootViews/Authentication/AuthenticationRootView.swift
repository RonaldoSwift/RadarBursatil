import Foundation
import Login
import SwiftUI


struct AuthenticationRootView: View {
    
    @State var isActiveLogin: Bool = false
    @State var isActiveRegister: Bool = false
    @State var isActiveVerificarEmail: Bool = false
    
    var body: some View {
        NavigationView {
            LoginView()
        }
    }
}
