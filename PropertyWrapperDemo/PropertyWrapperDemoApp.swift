//
//  PropertyWrapperDemoApp.swift
//  PropertyWrapperDemo
//
//  Created by Артемий Андреев  on 31.05.2025.
//


import SwiftUI

@main
struct WrapperPlaygroundApp: App {
    @StateObject private var theme = ThemeSettings()

    var body: some Scene {
        WindowGroup {
            ExamplesListView()
                .environmentObject(theme)
                .preferredColorScheme(theme.scheme)
        }
    }
}
