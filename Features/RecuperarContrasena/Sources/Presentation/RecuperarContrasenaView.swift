//
//  RecuperarContrasena.swift
//  Login
//
//  Created by Ronaldo Andre on 28/04/26.
//

import SwiftUI

public struct RecuperarContrasenaView: View {
    
    @State private var email: String = ""
    
    var onBack: () -> Void = {}
    var onSend: (String) -> Void = { _ in }
    
    public init(
        onBack: @escaping () -> Void = {},
        onSend: @escaping (String) -> Void = { _ in }
    ) {
        self.onBack = onBack
        self.onSend = onSend
    }
    
    public var body: some View {
        VStack {
            // HEADER
            HStack {
                Spacer()
                
                HStack(spacing: 8) {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 30, height: 30)
                        .overlay(
                            Image(systemName: "chart.line.uptrend.xyaxis")
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                        )
                    
                    Text("Radar Bursátil")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                }
                
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 10)
            
            Spacer().frame(height: 30)
            
            // ICONO CENTRAL
            ZStack {
                
                Circle()
                    .fill(Color.green.opacity(0.15))
                    .frame(width: 180, height: 180)
                
                Circle()
                    .fill(Color.green.opacity(0.1))
                    .frame(width: 150, height: 150)
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 120, height: 120)
                    .shadow(color: .black.opacity(0.05), radius: 10, y: 5)
                
                Image(systemName: "lock.rotation")
                    .foregroundColor(.green)
                    .font(.system(size: 30))
            }
            
            Spacer().frame(height: 30)
            
            // TITULO
            Text("Recuperar contraseña")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.black.opacity(0.85))
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 10)
            
            // DESCRIPCIÓN
            Text("Ingresa tu correo electrónico para recibir las instrucciones de recuperación.")
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
            
            Spacer().frame(height: 30)
            
            // INPUT EMAIL
            VStack(alignment: .leading, spacing: 6) {
                
                Text("Correo electrónico")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.black.opacity(0.7))
                
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                    
                    TextField("ejemplo@correo.com", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(.systemGray6))
                )
            }
            .padding(.horizontal, 24)
            
            Spacer().frame(height: 25)
            
            // BOTÓN
            Button(action: {
                onSend(email)
            }) {
                Text("Enviar instrucciones")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(30)
                    .shadow(color: Color.green.opacity(0.4), radius: 10, y: 5)
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            // FOOTER
            HStack(spacing: 4) {
                Text("¿Aún tienes problemas?")
                    .foregroundColor(.gray)
                
                Button("Contactar soporte") {
                    // acción soporte
                }
                .foregroundColor(.green)
            }
            .font(.footnote)
            .padding(.bottom, 20)
        }
        .background(Color(.systemGray6))
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    RecuperarContrasenaView()
}
