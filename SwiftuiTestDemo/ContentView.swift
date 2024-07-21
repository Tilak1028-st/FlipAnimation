//
//  ContentView.swift
//  SwiftuiTestDemo
//
//  Created by Tilak Shakya on 21/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showFront = true

    var body: some View {
        VStack {
            Spacer()
            
            if showFront {
                Text("Front Side")
                    .font(.largeTitle)
                    .frame(width: 200, height: 200)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .transition(.flip)
            } else {
                Text("Back Side")
                    .font(.largeTitle)
                    .frame(width: 200, height: 200)
                    .background(Color.red)
                    .cornerRadius(20)
                    .transition(.flip)
            }
            
            Spacer()

            Button("Flip") {
                withAnimation {
                    showFront.toggle()
                }
            }
            .padding()
            .font(.title)
        }
    }
}


struct FlipTransition: ViewModifier {
    var isActive: Bool

    func body(content: Content) -> some View {
        content
            .rotation3DEffect(
                .degrees(isActive ? 180 : 0),
                axis: (x: 1, y: 0, z: 0)
            )
            .animation(.easeInOut(duration: 1), value: isActive)
    }
}

extension AnyTransition {
    static var flip: AnyTransition {
        .modifier(
            active: FlipTransition(isActive: true),
            identity: FlipTransition(isActive: false)
        )
    }
}



#Preview {
    ContentView()
}
