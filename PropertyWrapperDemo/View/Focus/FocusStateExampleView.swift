//
//  FocusStateExampleView.swift
//  PropertyWrapperDemo
//
//  Created by Артемий Андреев  on 31.05.2025.
//

import SwiftUI

struct FocusStateExampleView: View {
    enum Field: Hashable { case first, last, email }

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""

    @FocusState private var focusedField: Field?

    var body: some View {
        VStack(spacing: 20) {
            Text("Registration form").font(.headline)

            Group {
                TextField("First name", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .focused($focusedField, equals: .first)

                TextField("Last name", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .focused($focusedField, equals: .last)

                TextField("E-mail", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .focused($focusedField, equals: .email)
            }
            .submitLabel(.next)
            .onSubmit {
                switch focusedField {
                case .first: focusedField = .last
                case .last:  focusedField = .email
                default:     focusedField = nil
                }
            }

            Button("Dismiss keyboard") { focusedField = nil }
                .buttonStyle(PrimaryButtonStyle())
        }
        .padding()
    }
}
