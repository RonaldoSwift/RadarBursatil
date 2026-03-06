//
//  VerificarIdentidadView.swift
//  RadarBursatil
//
//  Created by Ronaldo Andre on 5/03/26.
//
import SwiftUI

struct VerificarIdentidadView: View {
    
    @State private var code: [String] = Array(repeating: "", count: 6)
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack {
                
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                HStack(spacing: 8) {
                    Capsule()
                        .fill(Color.green)
                        .frame(width: 30, height: 6)
                    
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 6, height: 6)
                    
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 6, height: 6)
                }
                
                Spacer()
                
                Spacer().frame(width: 20)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Verifica tu identidad")
                        .font(.system(size: 32, weight: .bold))
                    
                    Text("Hemos enviado un código de 6 dígitos a ")
                    +
                    Text("usuario@email.com")
                        .fontWeight(.semibold)
                    +
                    Text(". Por favor, ingrésalo a continuación para continuar.")
                    
                }
                .foregroundColor(Color("colorTituloLogin"))
                
                HStack(spacing: 12) {
                    
                    ForEach(0..<6) { index in
                        
                        TextField("", text: $code[index])
                            .frame(width: 50, height: 60)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .font(.system(size: 20, weight: .bold))
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(index == 0 ? Color.green : Color.gray.opacity(0.3), lineWidth: 2)
                            )
                    }
                }
                .padding(.top, 10)
                
                Spacer()
                
                Button(action: {}) {
                    HStack {
                        Text("Verificar")
                            .fontWeight(.bold)
                        
                        Image(systemName: "checkmark.circle")
                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(30)
                }
                .shadow(color: .green.opacity(0.3), radius: 10, x: 0, y: 5)
                
                VStack(spacing: 6) {
                    
                    Text("¿No recibiste el código?")
                        .foregroundColor(.gray)
                    
                    Button(action: {}) {
                        Text("Reenviar código")
                            .foregroundColor(.green)
                            .fontWeight(.medium)
                    }
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    HStack(spacing: 6) {
                        Image(systemName: "shield")
                            .font(.system(size: 12))
                        
                        Text("RADAR BURSÁTIL SECURITY")
                            .font(.caption2)
                            .fontWeight(.medium)
                    }
                    .foregroundColor(.gray.opacity(0.6))
                    Spacer()
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 30)
        }
        .background(Color.white)
    }
}

#Preview {
    VerificarIdentidadView()
}
