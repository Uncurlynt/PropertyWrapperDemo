//
//  Theme.swift
//  PropertyWrapperDemo
//
//  Created by Артемий Андреев  on 31.05.2025.
//

import SwiftUI

final class ThemeSettings: ObservableObject {
    @AppStorage("selectedColorScheme") private var storedScheme: Int = 0 {
        didSet {
            selection = ColorSchemeOption(rawValue: storedScheme) ?? .system
        }
    }

    @Published var selection: ColorSchemeOption = .system

    var scheme: ColorScheme? {
        selection.scheme
    }

    init() {
        selection = ColorSchemeOption(rawValue: storedScheme) ?? .system
    }

    func update(to option: ColorSchemeOption) {
        storedScheme = option.rawValue
    }
}

extension ThemeSettings {
    enum ColorSchemeOption: Int, CaseIterable, Identifiable {
        case system = 0, light, dark
        var id: Int { rawValue }

        var description: String {
            switch self {
            case .system: return "System"
            case .light:  return "Light"
            case .dark:   return "Dark"
            }
        }

        var scheme: ColorScheme? {
            switch self {
            case .system: return nil
            case .light:  return .light
            case .dark:   return .dark
            }
        }
    }
}

struct Theme {
    static let accent = Color.purple
}
