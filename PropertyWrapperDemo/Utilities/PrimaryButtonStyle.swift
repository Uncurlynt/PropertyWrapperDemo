//
//  PrimaryButtonStyle.swift
//  PropertyWrapperDemo
//
//  Created by Артемий Андреев  on 31.05.2025.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(Theme.accent.opacity(configuration.isPressed ? 0.6 : 1))
            .foregroundColor(.white)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

