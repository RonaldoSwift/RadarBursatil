//
//  OnboardingRadarScoreView.swift
//  Login
//
//  Created by Ronaldo Andre on 22/04/26.
//

import SwiftUI

struct OnboardingRadarScoreView: View {
    
    var onStart: () -> Void = {}
    
    var body: some View {
        
        ZStack {
            // Fondo (este sí puede ignorar safe area si quieres full color)
            Color(.systemGray6)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                // ILUSTRACIÓN
                ZStack {
                    
                    Circle()
                        .fill(Color.green.opacity(0.1))
                        .frame(width: 260, height: 260)
                    
                    Circle()
                        .stroke(Color.green.opacity(0.2), lineWidth: 1)
                        .frame(width: 220, height: 220)
                    
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color.white)
                        .frame(width: 240, height: 180)
                        .shadow(color: .black.opacity(0.05), radius: 10, y: 5)
                    
                    VStack(spacing: 10) {
                        
                        HStack {
                            Circle()
                                .fill(Color.green)
                                .frame(width: 28, height: 28)
                                .overlay(
                                    Image(systemName: "shield.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14))
                                )
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 80, height: 8)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 8)
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 140, height: 8)
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        HStack(alignment: .bottom, spacing: 8) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 20, height: 20)
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 20, height: 30)
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.green.opacity(0.4))
                                .frame(width: 20, height: 45)
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.green)
                                .frame(width: 20, height: 60)
                        }
                        .padding(.bottom, 12)
                    }
                    
                    // icono flotante
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.white)
                        .frame(width: 60, height: 50)
                        .shadow(radius: 5)
                        .overlay(
                            Image(systemName: "arrow.up.right")
                                .foregroundColor(.green)
                        )
                        .offset(x: 100, y: -20)
                }
                
                Spacer().frame(height: 40)
                
                // TEXTO
                VStack(spacing: 12) {
                    Text("Invierte con\nconfianza")
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Toma decisiones basadas en datos reales y proyecciones a 5 años. Tu camino a la libertad financiera empieza aquí.")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    Spacer().frame(height: 20)
                    
                    // INDICADOR
                    HStack(spacing: 6) {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 6, height: 6)
                        
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 6, height: 6)
                        
                        Capsule()
                            .fill(Color.green)
                            .frame(width: 24, height: 6)
                    }
                }
                
                Spacer()
                
                // BOTÓN
                Button(action: {
                    onStart()
                }) {
                    Text("Comenzar ahora")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(30)
                        .shadow(color: Color.green.opacity(0.4), radius: 10, y: 5)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 20) // 👈 dentro del safe area
                
            }
        }
    }
}

#Preview {
    OnboardingRadarScoreView()
}
