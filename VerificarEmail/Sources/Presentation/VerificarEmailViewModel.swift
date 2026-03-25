//
//  VerificarEmailViewModel.swift
//  Login
//
//  Created by Ronaldo Andre on 25/03/26.
//

import Foundation
import Combine
import Swinject
@MainActor

class VerificarEmailViewModel: ObservableObject {
    
    private let repositoryVericarEmail: RepositoryVericarEmail
    
    @Published var email: String = ""
    
    @Published var message = ""
    @Published var isLoading = false
    @Published var showAlert = false
    
    init(repositoryVericarEmail: RepositoryVericarEmail) {
        self.repositoryVericarEmail = repositoryVericarEmail
    }
    
    func registerEmailVerificar(){
        
    }
}
