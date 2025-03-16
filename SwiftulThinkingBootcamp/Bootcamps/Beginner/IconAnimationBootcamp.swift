//
//  IconAnimationBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 28/09/24.
//

import SwiftUI

struct IconAnimationBootcamp: View {
    
    @State private var animate = false
    
//    var body: some View {
//        VStack {
//            Label("Text", systemImage: animate ? "paperplane.fill" : "xmark")
//                .foregroundStyle(.blue)
//                .font(.largeTitle)
//                .contentTransition(.opacity)
//            
//            Button("Animate") {
//                animate.toggle()
//            }
//        }
//            
//    }
    
    private static let font1 = Font.system(size: 20)
    private static let font2 = Font.system(size: 45)


    @State private var color = Color.red
    @State private var currentFont = font1


    var body: some View {
        VStack {
            Text("Content transition")
                .foregroundColor(color)
                .font(currentFont)
                .contentTransition(.interpolate)
            Spacer()
            Button("Change") {
                withAnimation(Animation.snappy(duration: 1.0)) {
                    color = (color == .red) ? .green : .red
                    currentFont = (currentFont == IconAnimationBootcamp.font1) ? IconAnimationBootcamp.font2 : IconAnimationBootcamp.font1
                }
            }
        }
    }
}

#Preview {
    IconAnimationBootcamp()
}
