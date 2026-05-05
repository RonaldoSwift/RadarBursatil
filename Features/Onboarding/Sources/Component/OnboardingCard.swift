//
//  OnboardingCard.swift
//  Login
//
//  Created by Ronaldo Andre on 27/04/26.
//

import Foundation
import SwiftUI

struct OnboardingCard {
 
    var onNext: () -> Void
    var onSkip: () -> Void
    
    var body: some View {
        VStack {
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
            .padding(.top, 16)
            
            Spacer()
            //Imagen Central
            ZStack {
                
            }
            Spacer().frame(height: 30)
        }
    }
}
