//
//  EnvironmentExampleView.swift
//  PropertyWrapperDemo
//
//  Created by Артемий Андреев  on 31.05.2025.
//

import SwiftUI

struct EnvironmentExampleView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.locale) private var locale
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        VStack(spacing: 24) {
            Group {
                Text("System color scheme:")
                    .font(.headline)
                Text(colorScheme == .dark ? "Dark" : "Light")
                    .font(.title2)
            }

            Group {
                Text("Locale:")
                    .font(.headline)
                Text(locale.identifier)
                    .font(.title3)
            }

            Button("Close") { presentationMode.wrappedValue.dismiss() }
                .buttonStyle(PrimaryButtonStyle())
        }
        .padding()
    }
}
