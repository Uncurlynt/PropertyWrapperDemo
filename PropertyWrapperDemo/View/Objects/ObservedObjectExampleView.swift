//
//  ObservedObjectExampleView.swift
//  PropertyWrapperDemo
//
//  Created by Артемий Андреев  on 31.05.2025.
//

import SwiftUI

struct ObservedObjectExampleView: View {
    @State private var showDetail = false
    private let sharedModel = CounterViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Button("Open counter") { showDetail.toggle() }
                .buttonStyle(PrimaryButtonStyle())

            if showDetail {
                CounterDetailView(model: sharedModel)
                    .padding(.top, 16)
            }
        }.padding()
    }
}

struct CounterDetailView: View {
    @ObservedObject var model: CounterViewModel

    var body: some View {
        VStack(spacing: 12) {
            Text("Shared count: \(model.count)")
            Button("Add") { model.increment() }
                .buttonStyle(PrimaryButtonStyle())
        }
    }
}

