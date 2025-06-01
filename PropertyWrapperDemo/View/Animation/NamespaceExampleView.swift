//
//  NamespaceExampleView.swift
//  PropertyWrapperDemo
//
//  Created by Артемий Андреев  on 1.06.2025.
//

import SwiftUI

struct NamespaceExampleView: View {
    @Namespace private var ns
    @State private var isExpanded = false

    var body: some View {
        ZStack {
            if !isExpanded {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Theme.accent)
                    .matchedGeometryEffect(id: "box", in: ns)
                    .frame(width: 120, height: 120)
                    .onTapGesture { withAnimation(.easeInOut) { isExpanded.toggle() } }
                    .padding()
            } else {
                RoundedRectangle(cornerRadius: 0)
                    .fill(Theme.accent)
                    .matchedGeometryEffect(id: "box", in: ns)
                    .ignoresSafeArea()
                    .onTapGesture { withAnimation(.easeInOut) { isExpanded.toggle() } }
            }
        }
    }
}
