//
//  ExamplesListView.swift
//  PropertyWrapperDemo
//
//  Created by Артемий Андреев  on 31.05.2025.
//

import SwiftUI

struct ExamplesListView: View {

    var body: some View {
        NavigationStack {
            List {
                // MARK: - State
                Section("State") {
                    navLink("@State — Counter", systemImage: "1.circle") {
                        StateExampleView()
                    }
                    navLink("@Binding — Color toggle", systemImage: "2.circle") {
                        BindingExampleView()
                    }
                }

                // MARK: - Objects
                Section("Objects") {
                    navLink("@StateObject + @Published", systemImage: "3.circle") {
                        StateObjectExampleView()
                    }
                    navLink("@ObservedObject — Shared counter", systemImage: "4.circle") {
                        ObservedObjectExampleView()
                    }
                    navLink("@EnvironmentObject — Theme", systemImage: "5.circle") {
                        EnvironmentObjectExampleView()
                    }
                }

                // MARK: - Environment / Storage
                Section("Environment / Storage") {
                    navLink("@Environment — System values", systemImage: "6.circle") {
                        EnvironmentExampleView()
                    }
                    navLink("AppStorage / SceneStorage", systemImage: "7.circle") {
                        StorageExampleView()
                    }
                }

                // MARK: - Focus & Gestures
                Section("Focus & Gestures") {
                    navLink("@FocusState — Form", systemImage: "8.circle") {
                        FocusStateExampleView()
                    }
                    navLink("@GestureState — Drag sheet", systemImage: "9.circle") {
                        BottomSheetExampleView()
                    }
                }

                // MARK: - Animation
                Section("Animation") {
                    navLink("matchedGeometryEffect", systemImage: "10.circle") {
                        NamespaceExampleView()
                    }
                }

                // MARK: - Settings
                Section("Settings") {
                    navLink("Theme picker", systemImage: "paintpalette") {
                        ThemePickerView()
                    }
                }
            }
            .navigationTitle("Property Wrappers")
        }
    }

    @ViewBuilder
    private func navLink<Content: View>(
        _ title: String,
        systemImage: String,
        @ViewBuilder destination: @escaping () -> Content
    ) -> some View {
        NavigationLink {
            destination()
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
        } label: {
            Label(title, systemImage: systemImage)
        }
    }
}
