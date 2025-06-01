//
//  StateExampleView.swift
//  PropertyWrapperDemo
//
//  Created by Артемий Андреев  on 31.05.2025.
//

import SwiftUI

struct StateExampleView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 16) {
            Text("Count: \(count)")
                .font(.largeTitle.bold())

            Button("Add") { count += 1 }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.horizontal, 40)
        }
        .padding()
    }
}
