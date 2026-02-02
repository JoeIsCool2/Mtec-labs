// CustomView.swift
// AdvancedTechniquesLab
//
// Created by Ethan Allgaier on 1/5/26.
//
import SwiftUI

struct CustomView: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(.blue)
      .padding()
      .frame(width: 350, height: 70)
      .shadow(radius: 10)
      .background(Color.gray.opacity(0.1))
      .cornerRadius(12)
  }
}
