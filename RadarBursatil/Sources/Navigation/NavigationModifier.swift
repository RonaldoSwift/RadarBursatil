//
//  NavigationModifier.swift
//  Login
//
//  Created by Ronaldo Andre on 14/04/26.
//

import Foundation
import SwiftUI

struct NavigationModifier: ViewModifier {
    
    var destination: AnyView
    @Binding var isActive: Bool
    
    func body(content: Content) -> some View {
        content
            .background(
                NavigationLink(
                    destination: destination,
                    isActive: $isActive
                ) {
                    EmptyView()
                }
            )
    }
}
