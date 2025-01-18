//
//  IntroView.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 17/01/25.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("isUserSignedIn") private var isUserSignedIn = false
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                // Background
                RadialGradient(
                    colors: [.white, .purple, .purple.opacity(0.7)],
                    center: .topLeading,
                    startRadius: 5,
                    endRadius: proxy.size.height
                )
                .ignoresSafeArea(edges: .vertical)
                
                if isUserSignedIn {
                    ProfileView()
                        .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
                }
                else {
                    OnboardingView()
                        .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
                }
            }
            .animation(.linear, value: isUserSignedIn)
        }
    }
}

#Preview {
    IntroView()
}
