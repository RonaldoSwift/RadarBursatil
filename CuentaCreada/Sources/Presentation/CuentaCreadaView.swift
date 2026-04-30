//
//  CuentaCreadaView.swift
//  CuentaCreada
//
//  Created by Ronaldo Andre on 29/04/26.
//

import SwiftUI

public struct CuentaCreadaView: View {
    
    var onContinue: () -> Void = {}
    
    public init(onContinue: @escaping () -> Void) {
        self.onContinue = onContinue
    }
    
    public var body: some View {
        VStack {
            
            Spacer().frame(height: 40)
            
            // ICONO
            ZStack {
                Circle()
                    .fill(Color.green.opacity(0.15))
                    .frame(width: 200, height: 200)
                
                Circle()
                    .fill(Color.green.opacity(0.1))
                    .frame(width: 160, height: 160)
                
                Circle()
                    .fill(Color.green)
                    .frame(width: 90, height: 90)
                    .overlay(
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(.system(size: 40, weight: .bold))
                    )
            }
            
            Spacer().frame(height: 30)
            
            // TITULO
            Text("¡Cuenta creada!")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.black.opacity(0.9))
            
            Spacer().frame(height: 10)
            
            // DESCRIPCIÓN
            Text("¡Tu cuenta ha sido verificada con éxito. Ya puedes empezar a analizar el mercado como un profesional.")
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
            
            Spacer().frame(height: 30)
            
            // CARD INFO
            VStack(alignment: .leading, spacing: 12) {
                
                HStack {
                    Circle()
                        .fill(Color.green.opacity(0.2))
                        .frame(width: 36, height: 36)
                        .overlay(
                            Image(systemName: "chart.line.uptrend.xyaxis")
                                .foregroundColor(.green)
                        )
                    
                    VStack(alignment: .leading, spacing: 4) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.green.opacity(0.3))
                            .frame(width: 120, height: 6)
                        
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 80, height: 6)
                    }
                    
                    Spacer()
                    
                    Text("+4.28%")
                        .foregroundColor(.green)
                        .fontWeight(.bold)
                }
                
                Divider()
                
                HStack {
                    Text("Estado del Mercado: Abierto")
                        .foregroundColor(.gray)
                        .font(.footnote)
                    
                    Spacer()
                    
                    Circle()
                        .fill(Color.green)
                        .frame(width: 8, height: 8)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.green.opacity(0.2))
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                    )
            )
            .padding(.horizontal, 24)
            
            Spacer()
            
            // BOTON
            Button(action: {
                onContinue()
            }) {
                Text("Comenzar a explorar")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(30)
                    .shadow(color: Color.green.opacity(0.4), radius: 10, y: 5)
            }
            .padding(.horizontal, 24)
            
            Spacer().frame(height: 10)
            
            // FOOTER
            Text("Impulsado por Radar Bursátil AI Engine")
                .font(.footnote)
                .foregroundColor(.gray)
            
            Spacer().frame(height: 20)
        }
        .background(Color(.systemGray6))
    }
}

#Preview {
    CuentaCreadaView(onContinue: {})
}
