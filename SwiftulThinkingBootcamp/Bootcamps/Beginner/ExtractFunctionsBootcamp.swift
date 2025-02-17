//
//  ExtractFunctionsBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 10/11/24.
//

import SwiftUI

struct ExtractFunctionsBootcamp: View {
    
    @State private var isAnimated = false
    
    var body: some View {
        content
    }
    
    fileprivate func loader() -> some View {
        return Circle()
            .trim(from: 0, to: 0.8)
            .stroke(Color.blue, style: .init(lineWidth: 5))
            .rotationEffect(.degrees(isAnimated ? 0 : -360))
            .frame(width: 100, height: 100)
            .animation(.linear(duration: 1.5).repeatForever(autoreverses: false), value: isAnimated)
            .onAppear {
                isAnimated = true
            }
    }
    
    var content: some View {
        loader()
    }
}

#Preview {
    ExtractFunctionsBootcamp()
}
