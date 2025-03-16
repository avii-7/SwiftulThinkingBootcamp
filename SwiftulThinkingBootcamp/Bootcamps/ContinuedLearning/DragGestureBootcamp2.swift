//
//  DragGestureBootcamp2.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 16/03/25.
//

import SwiftUI

struct DragGestureBootcamp2: View {
    
    private static var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    @State private var initialOffset = screenHeight * 0.8
    
    @State private var yOffset: CGFloat = .zero
    
    @State private var chevronStyle: ChevronStyle = .up
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.5)
                .ignoresSafeArea()
            
            MySignUpView(chevronStyle: chevronStyle)
                .animation(.spring, value: yOffset)
                .animation(.spring, value: initialOffset)
                .offset(y: initialOffset)
                .offset(y: yOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            yOffset = value.translation.height
                        }
                        .onEnded { value in
                            if value.translation.height < -Self.screenHeight * 0.6 {
                                initialOffset = 0
                                chevronStyle = .down
                            }
                            else if value.translation.height > Self.screenHeight * 0.3 {
                                initialOffset = Self.screenHeight * 0.8
                                chevronStyle = .up
                            }
                            yOffset = 0
                        }
                    
                )
        }
    }
}

#Preview {
    DragGestureBootcamp2()
}

enum ChevronStyle {
    case up, down
}

struct MySignUpView: View {
    
    let chevronStyle: ChevronStyle
    
    var body: some View {
        
        VStack (spacing: 20) {
            Image(systemName: chevronStyle == .up ?  "chevron.up" : "chevron.down")
                .fontWeight(.semibold)
            
            Text("SignUp")
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("Trying drag gesture to create bottom sheet like behavior")
                .font(.subheadline)
                .multilineTextAlignment(.center)
            
            Spacer()
            Spacer()
        }
        .padding(.top)
        .padding()
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(.rect(cornerRadius: 15))
        .ignoresSafeArea(edges: .bottom)
    }
}
