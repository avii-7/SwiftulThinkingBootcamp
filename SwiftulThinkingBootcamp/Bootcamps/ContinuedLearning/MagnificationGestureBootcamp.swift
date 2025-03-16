//
//  MagnificationGestureBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 18/02/25.
//

/* Learnings: 📝
 1. OnChanged don't gives relative value, instead it gives absolute value starting from 1.0, no matter what's your current scaleEffect value is.
 */

// Update: MagnificationGesture will deprecate. And from iOS 17.0 you can use MagnifyGesture.
// However both gesture has .updating(_:) modifier. You can use that to achieve IG ZoomIn-ZoomOut effect. It automatically reset the state once your interaction endend. Read MagnifyGesture doc for example.

import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    @State private var scaleAmount = 0.0
    
    @State private var currentAmount = 0.0
    
    @GestureState private var magnifyBy = 1.0
    
    var body: some View {
        ig2
    }
    
    private var practise: some View {
        Text("You can zoom me !!! \n \(scaleAmount) \n \(currentAmount) ")
            .multilineTextAlignment(.center)
            .foregroundStyle(.white)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 150)
            .background(.red)
            .scaleEffect(1 + scaleAmount + currentAmount)
            .gesture(MagnifyGesture()
                .onChanged { value in
                    scaleAmount = value.magnification - 1
                }.onEnded { value in
                    currentAmount += scaleAmount
                    scaleAmount = 0
                }
            )
    }
    
    private var ig: some View {
        VStack (spacing: 15) {
            HStack {
                Circle().frame(width: 25, height: 25)
                Text("Arun Kumar")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            
            Rectangle()
                .frame(height: 200)
                .scaleEffect(1 + scaleAmount + currentAmount)
                .animation(.spring(), value: scaleAmount)
                .gesture(MagnifyGesture()
                    .onChanged { value in
                        scaleAmount = value.magnification - 1
                    }
                    .onEnded { value in
                        scaleAmount = 0
                    }
                )
            
            HStack (spacing: 10) {
                Image(systemName: "heart")
                Image(systemName: "text.bubble")
                Spacer()
                Image(systemName: "bookmark")
            }
            .font(.title3)
            .padding(.horizontal)
        }
    }
    
    private var ig2: some View {
        VStack (spacing: 15) {
            HStack {
                Circle().frame(width: 25, height: 25)
                Text("Arun Kumar")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            
            Rectangle()
                .frame(height: 200)
                .scaleEffect(magnifyBy)
                .animation(.spring(), value: scaleAmount)
                .gesture(MagnificationGesture()
                    .updating($magnifyBy) { value, state, transaction in
                        state = value
                    }
                )
            
            HStack (spacing: 10) {
                Image(systemName: "heart")
                Image(systemName: "text.bubble")
                Spacer()
                Image(systemName: "bookmark")
            }
            .font(.title3)
            .padding(.horizontal)
        }
    }
}

#Preview {
    MagnificationGestureBootcamp()
}
