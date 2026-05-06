//
//  ContrasenaActualizada.swift
//  ContrasenaActualizada
//
//  Created by Ronaldo Andre on 3/05/26.
//

import SwiftUI

struct ContrasenaActualizada: View {
    
    var onLogin: () -> Void = {}
    
    var body: some View {
        VStack {
            
            // HEADER
            HStack {
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
            
            Spacer()
          
            ZStack {
                Circle()
                    .fill(Color.green.opacity(0.15))
                    .frame(width: 200, height: 200)
                    .shadow(color: Color.green.opacity(0.3), radius: 30)
                
                Image(systemName: "shield")
                    .font(.system(size: 60))
                    .foregroundColor(Color.gray.opacity(0.6))
                
                // CHECK
                Circle()
                    .fill(Color.green)
                    .frame(width: 45, height: 45)
                    .overlay(
                        Image(systemName: "checkmark")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .bold))
                    )
                    .offset(x: 70, y: 70)
            }
            
            Spacer().frame(height: 30)
            
            // TITULO
            Text("Contraseña actualizada")
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(.black.opacity(0.9))
            
            Spacer().frame(height: 10)
            
            // DESCRIPCION
            Text("Tu contraseña ha sido restablecida correctamente.\nPor seguridad, te recomendamos no compartirla con nadie.")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.horizontal, 30)
            
            Spacer()
            
            // BOTON
            Button(action: {
                onLogin()
            }) {
                Text("Iniciar Sesión")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(30)
                    .shadow(color: Color.green.opacity(0.4), radius: 10, y: 5)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 30)
        }
        .background(Color(.systemGray5).opacity(0.4))
    }
}

#Preview {
    ContrasenaActualizada(onLogin: {})
}
