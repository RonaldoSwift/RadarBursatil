//
//  LoginView.swift
//  RadarBursatil
//
//  Created by Ronaldo Andre on 25/02/26.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                }
                
                Spacer()
                
                HStack(spacing: 8) {
                    Circle()
                        .frame(width: 28, height: 28)
                        .overlay(
                            Image("logoRadar")
                        )
                    
                    Text("Radar Bursátil")
                        .font(.custom("Inter_24pt-Bold", size: 18))
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 8)
            
            Spacer().frame(height: 50)
            
            
            VStack(alignment: .leading, spacing: 28) {
                
                // TITULO
                VStack(alignment: .leading, spacing: 8) {
                    Text("Impulsa tus\ninversiones")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(Color("colorTituloLogin"))
                    
                    Text("Ingresa tus credenciales para acceder al mercado en tiempo real.")
                        .foregroundColor(Color("colorLetraLogin"))
                        .font(.system(size: 16))
                }
                
                // EMAIL
                VStack(alignment: .leading, spacing: 8) {
                    Text("Email")
                        .font(.subheadline)
                        .foregroundColor(Color("colorLetraTextFieldUsuario"))
                        .fontWeight(.medium)
                    
                    TextField("ejemplo@correo.com", text: $email)
                        .padding()
                        .foregroundColor(Color("colorLetraLogin"))
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color("colorFondoCapsula"))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("colorbordeCapsula"), lineWidth: 1)
                        )
                }
                
                // PASSWORD
                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack {
                        Text("Contraseña")
                            .font(.subheadline)
                            .foregroundColor(Color("colorLetraTextFieldUsuario"))
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Text("¿Olvidaste tu contraseña?")
                                .font(.caption)
                                .foregroundColor(Color("colorFuenteLogo"))
                        }
                    }
                    
                    HStack {
                        Group {
                            if isPasswordVisible {
                                TextField("••••••••", text: $password)
                            } else {
                                SecureField("••••••••", text: $password)
                            }
                        }
                        .foregroundColor(Color("colorLetraLogin"))
                        
                        Button(action: {
                            //toggle() cambia un booleano al valor contrario.
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color("colorFondoCapsula"))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("colorbordeCapsula"), lineWidth: 1)
                    )
                }
                
                // LOGIN BUTTON
                Button(action: {
                    loginUser()
                }) {
                    Text("Iniciar Sesión")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("colorFuenteLogo"))
                        .cornerRadius(30)
                }
                .shadow(color: .green.opacity(0.3), radius: 10, x: 0, y: 5)
                
                // DIVIDER
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.3))
                    
                    Text("A CONTINUACIÓN")
                        .font(.caption)
                        .foregroundColor(Color("colorLetraLogin"))
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.3))
                }
                
                // GOOGLE BUTTON
                Button(action: {
                    print("Google")
                }) {
                    HStack {
                        Image("logoGoogle")
                        Text("Google")
                            .fontWeight(.medium)
                            .foregroundColor(Color("colorTituloLogin"))
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray.opacity(0.4))
                    )
                }
                
                // REGISTER
                HStack {
                    Spacer()
                    Text("¿No tienes cuenta?")
                        .foregroundColor(Color("colorLetraLogin"))
                    
                    Button(action: {
                        print("Registrarse gratis")
                    }) {
                        Text(" Registrarse gratis")
                            .foregroundColor(Color("colorFuenteLogo"))
                            .fontWeight(.semibold)
                    }
                    Spacer()
                }
                .padding(.top, 30)
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .background(Color.white)
    }
    
    
    func loginUser() {
        
        AuthService.shared.login(email: email, password: password) { result in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let response):
                    
                    print("Access Token:", response.access_token)
                    
                case .failure(let error):
                    
                    print("Error:", error.localizedDescription)
                }
            }
        }
    }
}


#Preview {
    LoginView()
}
