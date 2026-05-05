//
//  VerificarEmailView.swift
//  Login
//
//  Created by Ronaldo Andre on 25/03/26.
//

import SwiftUI

public struct VerificarEmailView: View {
    
    let email: String
    @StateObject private var viewModel: VerificarEmailViewModel
    @State private var code: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedIndex: Int?
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var onSuccess: () -> Void
    
    public init(email: String, viewModel: VerificarEmailViewModel, onSuccess: @escaping () -> Void) {
        self.email = email
        self.onSuccess = onSuccess
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 24) {
                
                HStack {
                    Button(action: {}) {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 32, height: 32)
                            .overlay(
                                Image(systemName: "wrench.and.screwdriver")
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                            )
                        
                        Text("Radar Bursátil")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                }
                .padding(.top)
                
                // TITULO
                Text("Verifica tu identidad")
                    .font(.system(size: 30, weight: .bold))
                
                // DESCRIPCION
                Text("Hemos enviado un código de 6 dígitos a \(Text(email).bold()). Por favor, ingrésalo a continuación para continuar.")
                    .foregroundColor(.gray)
                
                // OTP INPUTS
                HStack(spacing: 12) {
                    ForEach(0..<6, id: \.self) { index in
                        TextField("", text: $code[index])
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.center)
                            .font(.title3)
                            .frame(width: 52, height: 62)
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color(.systemGray6))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(
                                        focusedIndex == index
                                        ? Color.green
                                        : Color.gray.opacity(0.2),
                                        lineWidth: 1.5
                                    )
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
                
                Text("El código expira en \(formattedTime(viewModel.expireSeconds))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            Button(action: {
                let fullCode = code.joined()
                viewModel.email = email
                viewModel.confirmCode(code: fullCode)
            }) {
                Text("Verificar")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.black)
                    .cornerRadius(30)
                    .shadow(radius: 6, y: 4)
            }
            .padding(.horizontal, 24)
            
            if viewModel.resendSeconds == 0 {
                Button(action: {
                    viewModel.email = email
                    viewModel.resendCode()
                }) {
                    Text("Reenviar código")
                        .foregroundColor(.green)
                        .fontWeight(.semibold)
                }
            } else {
                Text("Reenviar código en \(formattedTime(viewModel.resendSeconds))")
                    .foregroundColor(.gray)
                    .fontWeight(.medium)
            }
        }
        .onReceive(timer) { _ in
            if viewModel.expireSeconds > 0 {
                viewModel.expireSeconds -= 1
            }
            
            if viewModel.resendSeconds > 0 {
                viewModel.resendSeconds -= 1
            }
        }
        .alert("Mensaje", isPresented: $viewModel.showAlert) {
            Button("OK") {
                if viewModel.isVerified {
                    onSuccess()
                }
            }
        } message: {
            Text(viewModel.message)
        }
    }
    
    private func formattedTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", minutes, secs)
    }
}

#Preview {
    VerificarEmailView(
        email: "usuario@email.com",
        viewModel: VerificarEmailViewModel(
            repositoryVericarEmail: RepositoryVericarEmail(
                authService: AuthServiceVerificarEmail()
            )
        ), onSuccess: {}
    )
}
