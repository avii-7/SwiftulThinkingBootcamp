//
//  CustomCurvesBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 20/11/24.
//

import SwiftUI

struct CustomCurvesBootcamp: View {
    var body: some View {
        ArcSample()
            .foregroundStyle(LinearGradient(colors: [Color.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
//            .stroke(lineWidth: 5)
            .frame(width: 200, height: 200)
//            .padding()
            .background {
                Rectangle().stroke(style: .init(dash: [5]))
            }
            .ignoresSafeArea()
    }
}

#Preview {
    CustomCurvesBootcamp()
}

struct ArcSample: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .init(x: rect.maxX, y: rect.midY))
            path.addArc(
                center: .init(
                    x: rect.midX,
                    y: rect.midY
                ),
                radius: rect.height/2,
                startAngle: .degrees(0),
                endAngle: .degrees(360),
                clockwise: false
            )
        }
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addQuadCurve(
                to: .init(x: rect.maxX, y: rect.maxY),
                control: .init(x: rect.minX, y: rect.maxY)
            )
            path.addLine(to: .zero)
        }
    }
}

struct WaterShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            path.move(to: .init(x: rect.minX, y: rect.midY))
            
            path.addQuadCurve(
                to: .init(x: rect.midX, y: rect.midY),
                control: .init(x: rect.width * 0.25, y: rect.height * 0.40)
            )
            path.addQuadCurve(
                to: .init(x: rect.maxX, y: rect.midY),
                control: .init(x: rect.width * 0.75, y: rect.height * 0.60)
            )
            
            path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
            path.addLine(to: .init(x: rect.minX, y: rect.maxY))
            path.addLine(to: .init(x: rect.minX, y: rect.midY))
        }
    }
}
