//
//  BottomSheetExampleView.swift
//  PropertyWrapperDemo
//
//  Created by Артемий Андреев  on 31.05.2025.
//

import SwiftUI

struct BottomSheetExampleView: View {
    @State private var offsetY: CGFloat = UIScreen.main.bounds.height * 0.35
    @GestureState private var dragOffset: CGFloat = 0

    private var maxHeight: CGFloat { UIScreen.main.bounds.height * 0.7 }
    private var minHeight: CGFloat { 100 }

    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()

            sheet
        }
        .animation(.easeOut, value: offsetY)
    }

    private var sheet: some View {
        VStack {
            Capsule()
                .frame(width: 40, height: 6)
                .foregroundColor(.secondary)
                .padding(.top, 8)
            Text("Drag me!")
                .font(.headline)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: maxHeight)
        .background(.thinMaterial)
        .cornerRadius(16)
        .offset(y: offsetY + dragOffset)
        .gesture(
            DragGesture()
                .updating($dragOffset) { value, state, _ in
                    state = value.translation.height
                }
                .onEnded { value in
                    let newOffset = offsetY + value.translation.height
                    if newOffset < maxHeight / 2 {
                        offsetY = minHeight
                    } else {
                        offsetY = maxHeight
                    }
                }
        )
    }
}
