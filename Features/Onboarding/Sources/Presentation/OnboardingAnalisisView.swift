//
//  OnboardingAnalisisView.swift
//  Login
//
//  Created by Ronaldo Andre on 22/04/26.
//

import SwiftUI

struct OnboardingAnalisisView: View {
    
    var onNext: () -> Void = {}
    var onSkip: () -> Void = {}
    
    var body: some View {
        
        VStack {
            // TOP
            HStack {
                Spacer()
                Button(action: {
                    onSkip()
                }) {
                    Text("Saltar")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .medium))
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 16) // 👈 separación correcta arriba
            
            Spacer()
            
            // ILUSTRACIÓN
            ZStack {
                Circle()
                    .fill(Color.green.opacity(0.1))
                    .frame(width: 260, height: 260)
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white)
                    .frame(width: 220, height: 180)
                    .shadow(color: .black.opacity(0.05), radius: 10, y: 5)
                
                HStack(alignment: .bottom, spacing: 10) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 20, height: 30)
                    
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 20, height: 40)
                    
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.green.opacity(0.4))
                        .frame(width: 20, height: 60)
                    
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.green)
                        .frame(width: 20, height: 80)
                }
                
                // ICONO IZQUIERDA
                Circle()
                    .fill(Color.green)
                    .frame(width: 50, height: 50)
                    .overlay(
                        Image(systemName: "arrow.up.right")
                            .foregroundColor(.white)
                    )
                    .offset(x: -120, y: 0)
                
                // ICONO DERECHA
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .frame(width: 80, height: 60)
                    .shadow(radius: 5)
                    .overlay(
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.green)
                    )
                    .offset(x: 90, y: -40)
            }
            
            Spacer().frame(height: 40)
            
            // TITULO
            Text("Analiza como un\nprofesional")
                .font(.system(size: 28, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color.black.opacity(0.85))
            
            Spacer().frame(height: 12)
            
            // DESCRIPCIÓN
            Text("Accede a métricas fundamentales de miles de empresas en segundos con una interfaz limpia y potente.")
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
            
            Spacer().frame(height: 30)
            
            // INDICADOR
            HStack(spacing: 6) {
                Capsule()
                    .fill(Color.green)
                    .frame(width: 24, height: 6)
                
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 6, height: 6)
                
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 6, height: 6)
            }
            
            Spacer().frame(height: 30)
            
            // BOTÓN
            Button(action: {
                onNext()
            }) {
                HStack {
                    Spacer()
                    Text("Siguiente")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding()
                .background(Color.green)
                .cornerRadius(30)
                .shadow(color: Color.green.opacity(0.4), radius: 10, y: 5)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 12) // 👈 separación real abajo
            
            // PASO
            Text("PASO 1 DE 3")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.bottom, 8)
            
        }
        .background(Color(.systemGray6))
    }
}

#Preview {
    OnboardingAnalisisView()
}
