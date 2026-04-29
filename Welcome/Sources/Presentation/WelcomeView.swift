//
//  WelcomeView.swift
//  Login
//
//  Created by Ronaldo Andre on 21/04/26.
//

import SwiftUI

public struct WelcomeView: View {
    
    var onLogin: () -> Void = {}
    var onRegister: () -> Void = {}
    
    public init(
        onLogin: @escaping () -> Void,
        onRegister: @escaping () -> Void
    ) {
        self.onLogin = onLogin
        self.onRegister = onRegister
    }
    
    public var body: some View {
        VStack {
            
            Spacer()
            
            VStack(spacing: 16) {
                
                ZStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 90, height: 90)
                    
                    Image(systemName: "chart.bar.fill")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold))
                }
                
                Text("RADAR BURSÁTIL")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.green)
                    .tracking(2)
            }
            
            Spacer().frame(height: 40)
            
            Text("Impulsa tus\ninversiones")
                .font(.system(size: 34, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 16)
            
            Text("Tu terminal financiera premium\npara decisiones inteligentes")
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            VStack(spacing: 16) {
                
                Button(action: {
                    onLogin()
                }) {
                    HStack {
                        Spacer()
                        Text("INICIAR SESIÓN")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Image(systemName: "arrow.right")
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [Color.green.opacity(0.7), Color.green],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(14)
                }
                
                Button(action: {
                    onRegister()
                }) {
                    Text("CREAR CUENTA GRATUITA")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.white.opacity(0.2))
                        )
                }
                
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.white.opacity(0.2))
                    
                    Text("O CONTINUAR CON")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.white.opacity(0.2))
                }
                .padding(.vertical, 10)
                
                Button(action: {
                    print("Google")
                }) {
                    HStack {
                        Image("logoGoogle")
                        Text("Google")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(14)
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .background(
            LinearGradient(
                colors: [
                    Color.black,
                    Color.black
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }
}

#Preview {
    WelcomeView(onLogin: {}, onRegister: {})
}
