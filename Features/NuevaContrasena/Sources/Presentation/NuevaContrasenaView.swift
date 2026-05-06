//
//  NuevaContrasenaView.swift
//  CuentaCreada
//
//  Created by Ronaldo Andre on 3/05/26.
//

import SwiftUI

struct NuevaContrasenaView: View {
    
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isPasswordVisible = false
    @State private var isConfirmVisible = false
    
    var body: some View {
        VStack {
            
            // HEADER
            HStack {
                Button(action: {
                    // acción volver
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                HStack(spacing: 8) {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 28, height: 28)
                        .overlay(
                            Image(systemName: "chart.line.uptrend.xyaxis")
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                        )
                    
                    Text("Radar Bursátil")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            VStack(alignment: .leading, spacing: 24) {
                
                // TITULO
                Text("Nueva Contraseña")
                    .font(.system(size: 30, weight: .bold))
                
                Text("Crea una contraseña segura para proteger tu cuenta de Radar Bursátil.")
                    .foregroundColor(.gray)
                
                // PASSWORD
                VStack(alignment: .leading, spacing: 6) {
                    Text("Nueva contraseña")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                        
                        Group {
                            if isPasswordVisible {
                                TextField("", text: $password)
                            } else {
                                SecureField("", text: $password)
                            }
                        }
                        
                        Button {
                            isPasswordVisible.toggle()
                        } label: {
                            Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(25)
                }
                
                // CONFIRM PASSWORD
                VStack(alignment: .leading, spacing: 6) {
                    Text("Confirmar nueva contraseña")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    HStack {
                        Image(systemName: "lock.rotation")
                            .foregroundColor(.gray)
                        
                        Group {
                            if isConfirmVisible {
                                TextField("", text: $confirmPassword)
                            } else {
                                SecureField("", text: $confirmPassword)
                            }
                        }
                        
                        Button {
                            isConfirmVisible.toggle()
                        } label: {
                            Image(systemName: isConfirmVisible ? "eye" : "eye.slash")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(25)
                }
                
                // VALIDACIONES
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("TU CONTRASEÑA DEBE TENER:")
                        .font(.caption)
                        .fontWeight(.bold)
                    
                    VStack(spacing: 10) {
                        
                        HStack {
                            Circle()
                                .fill(password.count >= 8 ? Color.green : Color.gray.opacity(0.3))
                                .frame(width: 20, height: 20)
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 10))
                                        .foregroundColor(.white)
                                )
                            
                            Text("Mínimo 8 caracteres")
                                .foregroundColor(.gray)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Circle()
                                .fill(hasUppercase(password) ? Color.green : Color.gray.opacity(0.3))
                                .frame(width: 20, height: 20)
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 10))
                                        .foregroundColor(.white)
                                )
                            
                            Text("Al menos una mayúscula")
                                .foregroundColor(.gray)
                            
                            Spacer()
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(20)
                
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            // BOTON
            Button(action: {
                // acción actualizar contraseña
            }) {
                Text("Actualizar Contraseña")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(30)
                    .shadow(color: Color.green.opacity(0.4), radius: 10, y: 5)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 20)
        }
        .background(Color(.systemGray5).opacity(0.4))
    }
    
    // VALIDACIÓN MAYÚSCULA
    func hasUppercase(_ text: String) -> Bool {
        return text.rangeOfCharacter(from: .uppercaseLetters) != nil
    }
}

#Preview {
    NuevaContrasenaView()
}
