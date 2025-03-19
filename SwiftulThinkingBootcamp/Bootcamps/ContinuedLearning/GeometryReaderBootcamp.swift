//
//  GeometryReaderBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 18/03/25.
//

// Learnings: UIScreen.main.bounds is not adaptive to orientation use GeometryReader instead.

import SwiftUI

struct GeometryReaderBootcamp: View {
    
    var body: some View {
        content2
    }
    
    private var content: some View {
        HStack (spacing: 0) {
            Rectangle()
                .fill(.blue.opacity(0.5))
                .frame(width: UIScreen.main.bounds.width * 0.5)
            
            Rectangle().fill(.pink.opacity(0.5))
                .frame(width: UIScreen.main.bounds.width * 0.5)
        }
        .ignoresSafeArea()
    }
    
    private var content1: some View {
        GeometryReader { proxy in
            HStack (spacing: 0) {
                Rectangle()
                    .fill(.blue.opacity(0.5))
                    .frame(width: proxy.size.width * 0.5)
                
                Rectangle().fill(.pink.opacity(0.5))
                    .frame(width: proxy.size.width * 0.5)
            }
        }
        .ignoresSafeArea()
    }
    
    private var content2: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(0..<25) { index in
                    GeometryReader { proxy in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.blue.opacity(0.5))
                            .rotation3DEffect(.degrees(11), axis: (x: 0, y: 1, z: 0), anchor: .leading)
                    }
                    .frame(width: 300, height: 250)
                }
            }
            .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    GeometryReaderBootcamp()
}
