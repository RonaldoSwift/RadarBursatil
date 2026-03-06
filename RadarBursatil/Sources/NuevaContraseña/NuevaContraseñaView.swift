//
//  NuevaContraseñaView.swift
//  RadarBursatil
//
//  Created by Ronaldo Andre on 5/03/26.
//

import SwiftUI

struct NuevaContrasena_View: View {
    
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var isPasswordVisible: Bool = false
    @State private var isConfirmPasswordVisible: Bool = false
    
    var hasMinLength: Bool {
        password.count >= 8
    }
    
    var hasUppercase: Bool {
        password.contains { $0.isUppercase }
    }
    
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
                        .fill(Color.green)
                        .frame(width: 28, height: 28)
                        .overlay(
                            Image(systemName: "dot.radiowaves.left.and.right")
                                .foregroundColor(.black)
                                .font(.system(size: 12))
                        )
                    
                    Text("RADAR BURSÁTIL")
                        .font(.system(size: 16, weight: .semibold))
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            
            VStack(alignment: .leading, spacing: 24) {
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Nueva Contraseña")
                        .font(.system(size: 34, weight: .bold))
                    
                    Text("Crea una contraseña segura para proteger tu cuenta de Radar Bursátil.")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Nueva contraseña")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    HStack {
                        
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                        
                        Group {
                            if isPasswordVisible {
                                TextField("••••••••", text: $password)
                            } else {
                                SecureField("••••••••", text: $password)
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
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color(.systemGray6))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Confirmar nueva contraseña")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    HStack {
                        
                        Image(systemName: "lock.rotation")
                            .foregroundColor(.gray)
                        
                        Group {
                            if isConfirmPasswordVisible {
                                TextField("••••••••", text: $confirmPassword)
                            } else {
                                SecureField("••••••••", text: $confirmPassword)
                            }
                        }
                        
                        Button(action: {
                            isConfirmPasswordVisible.toggle()
                        }) {
                            Image(systemName: isConfirmPasswordVisible ? "eye" : "eye.slash")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color(.systemGray6))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                }
                
                
                // REGLAS CONTRASEÑA
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("TU CONTRASEÑA DEBE TENER:")
                        .font(.caption)
                        .fontWeight(.bold)
                    
                    HStack {
                        Circle()
                            .fill(hasMinLength ? Color.green.opacity(0.2) : Color.clear)
                            .frame(width: 24, height: 24)
                            .overlay(
                                Group {
                                    if hasMinLength {
                                        Image(systemName: "checkmark")
                                            .font(.system(size: 12))
                                            .foregroundColor(.green)
                                    } else {
                                        Circle()
                                            .stroke(Color.gray, lineWidth: 2)
                                    }
                                }
                            )
                        
                        Text("Mínimo 8 caracteres")
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Circle()
                            .fill(hasUppercase ? Color.green.opacity(0.2) : Color.clear)
                            .frame(width: 24, height: 24)
                            .overlay(
                                Group {
                                    if hasUppercase {
                                        Image(systemName: "checkmark")
                                            .font(.system(size: 12))
                                            .foregroundColor(.green)
                                    } else {
                                        Circle()
                                            .stroke(Color.gray, lineWidth: 2)
                                    }
                                }
                            )
                        
                        Text("Al menos una mayúscula")
                            .foregroundColor(.gray)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(.systemGray6))
                )
                
                
                Spacer()
                
                
                Button(action: {}) {
                    HStack {
                        Text("Actualizar Contraseña")
                            .fontWeight(.bold)
                        
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(30)
                }
                .shadow(color: .green.opacity(0.3), radius: 10, x: 0, y: 5)
                
                
                Text("Protegido por Radar Security Protocols ™")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                
            }
            .padding(.horizontal, 24)
            .padding(.top, 30)
        }
    }
}

#Preview {
    NuevaContrasena_View()
}
