//
//  AnimationBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 14/11/24.
//

import SwiftUI

struct AnimationBootcamp: View {
    
    @State private var animation = false
    
    var body: some View {
        VStack {
            Button("Animate") {
//                withAnimation(Animation.default.repeatCount(3, autoreverses: true)) {
                    animation.toggle()
//                }
            }
            Spacer()
            RoundedRectangle(cornerRadius: animation ? 50 : 10)
                .fill(animation ? Color.blue : Color.red)
                .frame(width: animation ? 50 : 100, height: animation ? 50 : 100)
                .rotationEffect(.degrees(animation ? 360: 0))
                .offset(y: animation ? 100 : 0)
                .animation(Animation.linear.repeatCount(5, autoreverses: true), value: animation)
            Spacer()
                
        }
    }
}

#Preview {
    AnimationBootcamp()
}
