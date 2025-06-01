//
//  ThemePickerView.swift
//  PropertyWrapperDemo
//
//  Created by Артемий Андреев  on 31.05.2025.
//

import SwiftUI

struct ThemePickerView: View {
    @EnvironmentObject private var theme: ThemeSettings

    var body: some View {
        Form {
            Picker("Color scheme", selection: $theme.selection) {
                ForEach(ThemeSettings.ColorSchemeOption.allCases) { option in
                    Text(option.description).tag(option)
                }
            }
        }
        .navigationTitle("Theme")
        .navigationBarTitleDisplayMode(.inline)
    }
}
