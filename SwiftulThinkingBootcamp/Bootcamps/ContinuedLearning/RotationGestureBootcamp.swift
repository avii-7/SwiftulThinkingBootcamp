//
//  RotationGestureBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 25/02/25.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State private var rotationAngle: Angle = .zero
    
    var body: some View {
        Text("Hello Universe")
            .foregroundStyle(.white)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(30)
            .background(.purple.opacity(0.5))
            .clipShape(.rect(cornerRadius: 10))
            .rotationEffect(rotationAngle)
            .animation(.spring, value: rotationAngle)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        rotationAngle = value.rotation
                    }
                    .onEnded { value in
                        rotationAngle = .zero
                    }
            )
    }
}

#Preview {
    RotationGestureBootcamp()
}
