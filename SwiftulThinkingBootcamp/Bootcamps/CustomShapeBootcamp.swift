//
//  CustomShapeBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 19/11/24.
//

import SwiftUI

struct CustomShapeBootcamp: View {
    var body: some View {
        Diamond()
            .stroke(lineWidth: 3)
            .frame(width: 200, height: 200)       
    }
}

#Preview {
    CustomShapeBootcamp()
}

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffet = rect.width * 0.2
            path.move(to: .init(x: rect.midX, y: rect.minY))
            path.addLine(to: .init(x: rect.minX + horizontalOffet, y: rect.midY))
            path.addLine(to: .init(x: rect.midX, y: rect.maxY))
            path.addLine(to: .init(x: rect.maxX - horizontalOffet, y: rect.midY))
            path.addLine(to: .init(x: rect.midX, y: rect.minY))
        }
    }
}
