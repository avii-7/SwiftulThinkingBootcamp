//
//  AnimationCurvesBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 15/11/24.
//

import SwiftUI

struct AnimationCurvesBootcamp: View {
    
    @State private var isAnimating = false
    
    private let duration = 0.5
    
    var body: some View {
        VStack {
            Button("Animate") {
                isAnimating.toggle()
            }
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red)
                .frame(width: isAnimating ? 350 : 100, height: 100)
                .animation(.linear(duration: duration), value: isAnimating)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue)
                .frame(width: isAnimating ? 350 : 100, height: 100)
                .animation(.easeIn(duration: duration), value: isAnimating)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.green)
                .frame(width: isAnimating ? 350 : 100, height: 100)
                .animation(.easeInOut(duration: duration), value: isAnimating)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.orange)
                .frame(width: isAnimating ? 350 : 100, height: 100)
                .animation(.easeOut(duration: duration), value: isAnimating)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.brown)
                .frame(width: isAnimating ? 350 : 100, height: 100)
                .animation(.spring(duration: duration, bounce: 0.6), value: isAnimating)
        }
    }
}

#Preview {
    AnimationCurvesBootcamp()
}
