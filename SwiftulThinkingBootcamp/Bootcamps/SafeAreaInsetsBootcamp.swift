//
//  SafeAreaInsetsBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 30/01/25.
//

/* Learnings 📝
 1. It allow us anchored content on safearea.
 2. You can achieve same thing with overlay.
 3. The modified view is inset by the height/widht of content, from edge, with its safe area increased by the same amount. In order to acheive the same thing you need to write extra code in overlays like using padding.
 */

import SwiftUI

struct SafeAreaInsetsBootcamp: View {
    
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("SafeArea Inset")
                .navigationBarTitleDisplayMode(.inline)
                .safeAreaInset(edge: .top) {
                    Button("Chat", systemImage: "message") { }
                    .padding(10)
                    .background()
                    .clipShape(.rect(cornerRadius: 10))
                }
        }
    }
    
    private var content: some View {
        List(1...10, id: \.self) { _ in
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 100)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    SafeAreaInsetsBootcamp()
}
