//
//  BindingExampleView.swift
//  PropertyWrapperDemo
//
//  Created by Артемий Андреев  on 31.05.2025.
//

import SwiftUI

struct BindingExampleView: View {
    @State private var isRed = false

    var body: some View {
        VStack(spacing: 24) {
            ColorToggleButton(isRed: $isRed)

            Rectangle()
                .fill(isRed ? .red : .blue)
                .frame(height: 120)
                .cornerRadius(12)
                .animation(.easeInOut, value: isRed)
        }
        .padding()
    }
}

struct ColorToggleButton: View {
    @Binding var isRed: Bool

    var body: some View {
        Button(isRed ? "Blue please" : "Red please") {
            isRed.toggle()
        }
        .buttonStyle(PrimaryButtonStyle())
    }
}
