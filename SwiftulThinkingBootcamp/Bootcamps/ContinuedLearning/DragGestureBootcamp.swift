//
//  DragGestureBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 16/03/25.
//

import SwiftUI

struct DragGestureBootcamp: View {
    
    @GestureState private var dragState: CGPoint = .zero
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("\(dragState.x)")
                
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.black)
                .frame(width: 250, height: 550)
                .animation(.linear, value: dragState)
                .scaleEffect(getScaleValue())
                .offset(.init(dragState))
                .rotationEffect(.degrees(getRotationAmount()))
                .gesture(DragGesture()
                    .updating($dragState, body: { value, state, transaction in
                        state = .init(value.translation)
                    }))
        }
    }
    
    private func getScaleValue() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let horizontalOffset = abs(dragState.x)
        
        let percentage = horizontalOffset / max
        let value =  1.0 - min(percentage, 0.5) * 0.5
        return value
    }
    
    private func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let horizontalOffset = dragState.x
        let percentage = horizontalOffset / max
        let maxAngle: Double = 10
        return percentage * maxAngle
        
        
        return 1
    }
}

#Preview {
    DragGestureBootcamp()
}

extension CGSize {
    
    init(_ point: CGPoint) {
        self.init(width: point.x, height: point.y)
    }
}

extension CGPoint {
    
    init(_ size: CGSize) {
        self.init(x: size.width, y: size.height)
    }
}
