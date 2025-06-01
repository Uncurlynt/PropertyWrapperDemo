//
//  StorageExampleView.swift
//  PropertyWrapperDemo
//
//  Created by Артемий Андреев  on 31.05.2025.
//

import SwiftUI

struct StorageExampleView: View {
    @AppStorage("username") private var username = ""
    @SceneStorage("draftText") private var draftText = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                Group {
                    Text("AppStorage example")
                        .font(.headline)
                    TextField("Enter name", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Saved: \(username)")
                        .font(.subheadline)
                }

                Divider()

                Group {
                    Text("SceneStorage example")
                        .font(.headline)
                    TextField("Draft", text: $draftText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Current draft: \(draftText)")
                        .font(.subheadline)
                }
            }
            .padding()
        }
    }
}
