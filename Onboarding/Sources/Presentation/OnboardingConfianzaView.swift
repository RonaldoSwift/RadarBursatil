//
//  OnboardingConfianzaView.swift
//  Login
//
//  Created by Ronaldo Andre on 22/04/26.
//

import SwiftUI

struct OnboardingConfianzaView: View {
    
    var onNext: () -> Void = {}
    var onSkip: () -> Void = {}
    
    var body: some View {
        VStack {
            
            // TOP
            HStack {
                Spacer()
                
                Button("Saltar") {
                    onSkip()
                }
                .foregroundColor(.gray)
                .font(.system(size: 16, weight: .medium))
            }
            .padding(.horizontal, 24)
            .padding(.top, 16) // 👈 separación real arriba
            
            Spacer()
            
            // CÍRCULO SCORE
            ZStack {
                
                Circle()
                    .fill(Color.green.opacity(0.15))
                    .frame(width: 260, height: 260)
                
                Circle()
                    .fill(Color.green.opacity(0.1))
                    .frame(width: 220, height: 220)
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 180, height: 180)
                    .shadow(color: .black.opacity(0.05), radius: 10, y: 5)
                
                VStack(spacing: 6) {
                    Text("RADAR SCORE™")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text("82")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.black.opacity(0.85))
                    
                    HStack(spacing: 6) {
                        Image(systemName: "arrow.up.right")
                        Text("EXCELENTE")
                            .fontWeight(.semibold)
                    }
                    .font(.caption)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.green.opacity(0.15))
                    .foregroundColor(.green)
                    .clipShape(Capsule())
                }
            }
            
            Spacer().frame(height: 30)
            
            // CARD
            HStack(spacing: 12) {
                
                Circle()
                    .fill(Color.green.opacity(0.15))
                    .frame(width: 40, height: 40)
                    .overlay(
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.green)
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Estado de la inversión")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text("Excelente Oportunidad")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black.opacity(0.85))
                }
                
                Spacer()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
            .padding(.horizontal, 24)
            
            Spacer().frame(height: 40)
            
            // TITULO
            Text("Radar Score™ Inteligente")
                .font(.system(size: 26, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(.black.opacity(0.85))
                .padding(.horizontal, 24)
            
            Spacer().frame(height: 10)
            
            // DESCRIPCIÓN
            Text("Nuestro algoritmo analiza la salud financiera, valuación y crecimiento para decirte si es momento de comprar.")
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
            
            Spacer().frame(height: 30)
            
            // INDICADOR
            HStack(spacing: 6) {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 6, height: 6)
                
                Capsule()
                    .fill(Color.green)
                    .frame(width: 24, height: 6)
                
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 6, height: 6)
            }
            
            Spacer().frame(height: 30)
            
            // BOTÓN
            Button(action: {
                onNext()
            }) {
                Text("Siguiente")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(30)
                    .shadow(color: Color.green.opacity(0.4), radius: 10, y: 5)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 20) // 👈 separación abajo real
            
        }
        .background(Color(.systemGray6))
    }
}

#Preview {
    OnboardingConfianzaView()
}
