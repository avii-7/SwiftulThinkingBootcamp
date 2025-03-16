//
//  LongTapGestureBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 17/02/25.
//

import SwiftUI

struct LongTapGestureBootcamp: View {
    
    @State private var progress = false
    
    @State private var isCompleted = false
    
    var body: some View {
        VStack(spacing: 15) {
            Rectangle()
                .fill(isCompleted ? .green : .blue)
                .frame(maxWidth: progress ? .infinity : 10)
                .frame(height: 50)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
                .padding(.horizontal, 10)
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            HStack {
                
                Text("Click Here")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .padding(10)
                    .background(.green)
                    .clipShape(.rect(cornerRadius: 10))
                    .onLongPressGesture(
                        minimumDuration: 1.0,
                        maximumDistance: 50) {
                            isCompleted = true
                        } onPressingChanged: { isPressed in
                            if isPressed {
                                progress = true
                            }
                            else if !isCompleted {
                                progress = false
                            }
                        }
                
                Text("Reset")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .padding(10)
                    .background(.gray)
                    .clipShape(.rect(cornerRadius: 10))
                    .onTapGesture {
                        progress = false
                        isCompleted = false
                    }
            }
        }
    }
}

#Preview {
    LongTapGestureBootcamp()
}
