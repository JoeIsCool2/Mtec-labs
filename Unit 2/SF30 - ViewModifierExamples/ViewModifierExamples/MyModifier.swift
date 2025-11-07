//
//  MyModifier.swift
//  ViewModifierExamples
//
//  Created by Toby Youngberg on 9/15/25.
//

import SwiftUI

struct MyModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding(5)
    }
}

struct BetterModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Copperplate", size: 40))
            .padding(5)
            .background(.black)
            .strikethrough(true, pattern: .dot)
            .border(Color.gray, width: 4)
            .foregroundStyle(.green)
            .grayscale(0.7)
    }
}

extension View {
    func myModifier() -> some View {
        modifier(MyModifier())
    }
    func betterModifier() -> some View {
        modifier(BetterModifier())
    }
}
