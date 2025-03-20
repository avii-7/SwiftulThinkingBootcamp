//
//  MaskBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 20/03/25.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State private var selectedIndex: CGFloat = 1
    
    var body: some View {
        starsView
            .overlay {
                overlayView.mask(starsView)
            }
    }
    
    private var overlayView: some View {
        GeometryReader { proxy in
            Rectangle()
                .fill(.yellow)
                .frame(width: proxy.size.width * selectedIndex / 5 )
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1...5) { index in
                Image(systemName: "star.fill")
                    .foregroundStyle(.gray)
                    .font(.largeTitle)
                    .frame(width: 40)
                    .onTapGesture { location in
                        if location.x < 40/2 {
                            selectedIndex = CGFloat(Double(index) - 0.5)
                        }
                        else {
                            selectedIndex = CGFloat(index)
                        }
                    }
            }
        }
    }
}

#Preview {
    MaskBootcamp()
}
