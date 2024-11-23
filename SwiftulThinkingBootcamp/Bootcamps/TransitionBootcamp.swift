//
//  TransitionBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 19/11/24.
//

import SwiftUI

struct TransitionBootcamp: View {
    
    @State private var showPopup = false
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Button ("Animate") {
                    withAnimation(.linear) {
                        showPopup.toggle()
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .overlay(alignment: .bottom) {
                if showPopup {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: geo.size.width,  height: geo.size.height * 0.5)
                        .transition(.move(edge: .bottom))
//                        .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .trailing)))
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    TransitionBootcamp()
}
