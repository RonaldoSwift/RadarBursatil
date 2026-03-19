//
//  RegisterView.swift
//  Login
//
//  Created by Ronaldo Andre on 17/03/26.
//

import SwiftUI

public struct RegisterView: View {
    
    @StateObject private var viewModel = RegisterViewModel()
    
    @State private var isPasswordVisible = false
    @State private var acceptTerms = false
    
    public init() {}

    public var body: some View {
        VStack {
            
            HStack {
                Button(action: {}) {
                    Image(systemName: "arrow.left")
                        .font(.title3)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                Text("Radar Bursátil")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 20) {
                
                // ICONO
                ZStack {
                    Circle()
                        .fill(Color.green.opacity(0.15))
                        .frame(width: 70, height: 70)
                    
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .foregroundColor(.green)
                        .font(.title)
                }
                
                // TITULO
                Text("Comienza a invertir")
                    .font(.system(size: 32, weight: .bold))
                
                
                // SUBTITULO
                Text("Únete a la plataforma líder en análisis bursátil y toma el control de tus finanzas.")
                    .foregroundColor(.gray)
                
                
                // NOMBRE
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text("Nombre completo")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                        
                        TextField("Ej. Juan Pérez", text: $viewModel.name)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(.systemGray6))
                    )
                }
                
                
                // EMAIL
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text("Correo electrónico")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                        
                        TextField("tu@correo.com", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(.systemGray6))
                    )
                }
                
                
                // PASSWORD
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text("Contraseña")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    HStack {
                        
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                        
                        Group {
                            if isPasswordVisible {
                                TextField("Mínimo 8 caracteres", text: $viewModel.password)
                            } else {
                                SecureField("Mínimo 8 caracteres", text: $viewModel.password)
                            }
                        }
                        
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(.systemGray6))
                    )
                }
                
                
                // CHECKBOX
                HStack(alignment: .top) {
                    
                    Button(action: {
                        acceptTerms.toggle()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                                .frame(width: 22, height: 22)
                            
                            if acceptTerms {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 12))
                            }
                        }
                    }
                    
                    (
                        Text("Acepto los ")
                        +
                        Text("Términos y Condiciones")
                            .foregroundColor(.green)
                        +
                        Text(" y la ")
                        +
                        Text("Política de Privacidad.")
                            .foregroundColor(.green)
                    )
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                }
                .font(.footnote)
                
                
                Button(action: {
                    viewModel.registerUser()
                }) {
                    ZStack {
                        if viewModel.isLoading {
                            ProgressView()
                        } else {
                            Text("Registrarse")
                                .fontWeight(.bold)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.black)
                    .cornerRadius(30)
                }
                .disabled(viewModel.isLoading)
                
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.3))
                    
                    Text("O CONTINÚA CON")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.3))
                }
                
                
                Button(action: {}) {
                    Text("Google")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(Color.black)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray.opacity(0.4))
                        )
                }
                
                HStack {
                    Spacer()
                    
                    Text("¿Ya tienes cuenta?")
                    
                    Text("Inicia sesión")
                        .foregroundColor(.green)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                .font(.footnote)
            }
            .padding(.horizontal, 24)
            Spacer()
        }
        .alert("Mensaje", isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.message)
        }
    }
}

#Preview {
    RegisterView()
}
