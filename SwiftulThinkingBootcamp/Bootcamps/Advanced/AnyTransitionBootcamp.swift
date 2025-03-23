//
//  AnyTransitionBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 23/03/25.
//

import SwiftUI

struct RotatingViewModifier: ViewModifier {
    
    let rotation: Double

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(rotation))
            .offset(
                x: rotation == 0 ? 0 : UIScreen.main.bounds.width,
                y: rotation == 0 ? 0 : (UIScreen.main.bounds.height * 0.5 )
            )
    }
}

extension AnyTransition {
    
    static var rotating: AnyTransition {
        .modifier(
            active: RotatingViewModifier(rotation: 180),
            identity: RotatingViewModifier(rotation: 0)
        )
    }
    
    static func rotating(by rotation: Double) -> AnyTransition {
        .modifier(
            active: RotatingViewModifier(rotation: rotation),
            identity: RotatingViewModifier(rotation: 0)
        )
    }
}

struct AnyTransitionBootcamp: View {
    
    @State private var showRectangle = false
    
    var body: some View {
        GeometryReader { proxy in
            VStack (alignment: .center)  {
                if showRectangle {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.purple.opacity(0.5))
                        .frame(width: proxy.size.width * 0.7, height: proxy.size.height * 0.5)
                        .frame(maxWidth: .infinity)
                        .transition(
                            .asymmetric(
                                insertion: .rotating(by: 360),
                                removal: .push(from: .trailing)
                            )
                        )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .safeAreaInset(edge: .bottom) {
                Button("Click Here") {
                    withAnimation(.easeInOut) {
                        showRectangle.toggle()
                    }
                }
                .buttonStyle(.borderedProminent)
                .font(.title3)
            }
        }
    }
}

#Preview {
    AnyTransitionBootcamp()
}
