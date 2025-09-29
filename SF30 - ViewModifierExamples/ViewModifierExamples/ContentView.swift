//
//  ContentView.swift
//  ViewModifierExamples
//
//  Created by Toby Youngberg on 8/27/25.
//

import SwiftUI

struct MyView: View {
  var body: some View {
      Text("Hello World")
          .font(.largeTitle)
          .bold(true)
          .italic(true)
          .strikethrough(true)
          .underline(true)
          .tint(.red)
          .border(Color.purple, width: 7)
          .overlay(.green)
          .background(.black)
          .hidden()
          .frame(width: 67, height: 76)
          .position(x: 67, y: 76)
          .padding(10)
          .offset(x: 0, y: 10)
      Text("This ones better")
          .betterModifier()
  }
}



#Preview {
    MyView()
}
