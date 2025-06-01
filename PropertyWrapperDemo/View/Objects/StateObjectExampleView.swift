//
//  StateObjectExampleView.swift
//  PropertyWrapperDemo
//
//  Created by Артемий Андреев  on 31.05.2025.
//

import SwiftUI
import Combine

struct StateObjectExampleView: View {
    @StateObject private var viewModel = CounterViewModel()

    var body: some View {
        VStack(spacing: 16) {
            Text("Count: \(viewModel.count)")
                .font(.title.bold())

            Button("Add") { viewModel.increment() }
                .buttonStyle(PrimaryButtonStyle())

            if viewModel.showCongrats {
                Text("ВАУ БЛИН")
                    .transition(.opacity)
            }
        }
        .padding()
        .animation(.spring, value: viewModel.showCongrats)
    }
}

final class CounterViewModel: ObservableObject {
    @Published var count = 0
    @Published var showCongrats = false

    private var cancellables = Set<AnyCancellable>()

    init() {
        $count
            .filter { $0 > 0 }
            .debounce(for: .seconds(0.3), scheduler: RunLoop.main)
            .sink { [weak self] _ in
                self?.flashCongrats()
            }
            .store(in: &cancellables)
    }

    func increment() { count += 1 }

    private func flashCongrats() {
        showCongrats = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.showCongrats = false
        }
    }
}

