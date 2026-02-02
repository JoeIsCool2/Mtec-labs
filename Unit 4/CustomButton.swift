// CustomButton.swift
// AdvancedTechniquesLab
//
// Created by Ethan Allgaier on 1/5/26.
//
import SwiftUI

struct CustomButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding()
      .frame(width: 350, height: 70)
      .shadow(radius: 10)
      .background(
        configuration.isPressed
        ? Color.blue.opacity(0.5)
        : Color.blue.opacity(1)
      )
      .scaleEffect(configuration.isPressed ? 1.5 : 1)
      .cornerRadius(12)
      .padding()
  }
}
