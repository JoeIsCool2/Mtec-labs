//
//  modifiers.swift
//  Buttons Lab
//
//  Created by joseph wright on 9/29/25.
//

import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .font(.custom("Futura", size: 18))
            .foregroundStyle(Color.black)
            .background(
                LinearGradient(colors: [.orangeish], startPoint: .leading, endPoint: .trailing)
                    .clipShape(Capsule())
            )
            .overlay(
                Capsule()
                    .stroke(Color.black, lineWidth: 2) // 🔑 border follows the capsule curve
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
            .padding()
    }
}


struct UnselectedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .font(.custom("Futura", size: 18))
            .foregroundStyle(Color.black)
            .background(
                LinearGradient(
                    colors: [.gray],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .opacity(0.5)
                    .clipShape(Capsule())
            )
            .overlay(
                Capsule()
                    .stroke(Color.black, lineWidth: 2))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
            .padding()
    }
}

struct SelectedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .font(.custom("Futura", size: 18))
            .foregroundStyle(Color.black)
            .glassEffect()
            .background(
                LinearGradient(
                    colors: [.orange, .orangeish],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .clipShape(Capsule())
            )
            .overlay(
                Capsule()
                    .stroke(Color.black, lineWidth: 2) )
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeIn, value: configuration.isPressed)
            .padding()
    }
}
extension View {
    @ViewBuilder
    func toggleStyle(_ selected: Bool) -> some View {
        if selected {
            self.buttonStyle(SelectedButton())
        } else {
            self.buttonStyle(UnselectedButton())
        }
    }
}
