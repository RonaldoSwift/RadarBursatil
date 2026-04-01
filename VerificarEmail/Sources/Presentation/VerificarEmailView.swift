//
//  VerificarEmailView.swift
//  Login
//
//  Created by Ronaldo Andre on 25/03/26.
//

import SwiftUI

public struct VerificarEmailView: View {
    
    @State private var code: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedIndex: Int?
    
    public init() {}
    
    public var body: some View {
        VStack {
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Button(action: {}) {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Text("RADAR BURSÁTIL")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .tracking(1)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                Text("Verifica tu correo")
                    .font(.system(size: 30, weight: .bold))
                    .padding(.top, 10)
                
                Text("Hemos enviado un código de 6 dígitos a tu correo ej***@correo.com. Por favor, ingrésalo a continuación.")
                    .foregroundColor(.gray)
                
                HStack(spacing: 12) {
                    ForEach(0..<6, id: \.self) { index in
                        TextField("", text: $code[index])
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.center)
                            .frame(width: 45, height: 55)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(.systemGray6))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray.opacity(0.3))
                            )
                            .focused($focusedIndex, equals: index)
                            .onTapGesture {
                                focusedIndex = index
                            }
                            .onChange(of: code[index]) { newValue in
                                if newValue.count > 1 {
                                    code[index] = String(newValue.prefix(1))
                                }
                                
                                if !newValue.isEmpty {
                                    focusedIndex = index < 5 ? index + 1 : nil
                                }
                            }
                    }
                }
                VStack(spacing: 6) {
                    Text("¿No recibiste el código?")
                        .foregroundColor(.gray)
                    
                    Button(action: {
                        print("Reenviar código")
                    }) {
                        Text("Reenviar código")
                            .foregroundColor(.green)
                            .fontWeight(.semibold)
                    }
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            Button(action: {
                let fullCode = code.joined()
                print("Código:", fullCode)
            }) {
                HStack {
                    Text("Verificar")
                        .fontWeight(.bold)
                    
                    Image(systemName: "arrow.right")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.black)
                .cornerRadius(30)
            }
            .padding(.horizontal, 24)
            .padding(.bottom)
        }
    }
}

#Preview {
    VerificarEmailView()
}
