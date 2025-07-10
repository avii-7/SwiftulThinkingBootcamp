//
//  DimensionChange.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 10/07/25.
//

import SwiftUI

struct DimensionChange: View {
    
    @State private var size: CGSize = .zero
    
    var body: some View {
        monitor5
            .ignoresSafeArea(edges: .vertical)
//            .overlay {
//                Text("Width: \(size.width) Height: \(size.height)")
//                    .foregroundStyle(.white)
//                    .font(.title2)
//                    .fontWeight(.bold)
//            }
    }
    
    private var monitor1: some View {
        Rectangle()
            .fill(.purple.opacity(0.5))
            .background(GeometryReader(content: { proxy in
                Color.clear
                    .onAppear {
                        size = proxy.size
                    }
            }))
            .ignoresSafeArea(edges: .vertical)
    }
    
    private var monitor2: some View {
        Rectangle()
            .fill(.purple.opacity(0.5))
            .onGeometryChange(for: CGSize.self, of: { proxy in
                proxy.size
            }, action: { newValue in
                size = newValue
            })
    }
    
    private var monitor3: some View {
        Rectangle()
            .fill(.blue.opacity(0.5))
            .overlay {
                Rectangle()
                    .fill(.purple.opacity(0.5))
                    .frame(width: 200, height: 200)
                    .background(.thinMaterial)
                    .visualEffect { effect, proxy in
                        effect
                    }
            }
    }
    
    private var monitor4: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(1...10, id: \.self) { _ in
                    Rectangle()
                        .fill(.orange)
                        .containerRelativeFrame([.vertical, .horizontal])
                }
            }
        }
        
    }
    
    private var monitor5: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(1...10, id: \.self) { i in
                    Rectangle()
                        .fill(.orange)
                        .containerRelativeFrame([.vertical, .horizontal], count: 3, span: i == 2 ? 2:  1, spacing: 0)
                }
            }
        }
        
    }
}

#Preview {
    DimensionChange()
}
