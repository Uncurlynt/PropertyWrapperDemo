//
//  EnvironmentObjectExampleView.swift
//  PropertyWrapperDemo
//
//  Created by Артемий Андреев  on 31.05.2025.
//

import SwiftUI

struct EnvironmentObjectExampleView: View {
    var body: some View {
        ThemeSwitcherView()
    }
}

struct ThemeSwitcherView: View {
    @EnvironmentObject var settings: ThemeSettings

    var body: some View {
        VStack(spacing: 16) {
            Text("Current scheme: \(settings.scheme == .dark ? "Dark" : "Light")")
                .font(.headline)

            Button("Toggle") {
                let option: ThemeSettings.ColorSchemeOption =
                    (settings.scheme == .dark) ? .light : .dark
                settings.update(to: option)
            }
            .buttonStyle(PrimaryButtonStyle())
        }
        .padding()
    }
}
