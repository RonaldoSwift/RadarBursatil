//
//  View+Extension.swift
//  Login
//
//  Created by Ronaldo Andre on 14/04/26.
//

import Foundation
import SwiftUI

extension View {
    func navigation(_ view: any View, _ isActive: Binding<Bool>) -> some View {
        modifier(
            NavigationModifier(
                destination: AnyView(view),
                isActive: isActive
            )
        )
    }
}
