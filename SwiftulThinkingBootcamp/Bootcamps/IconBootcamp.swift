//
//  IconBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 28/09/24.
//

import SwiftUI

struct IconBootcamp: View {
    var body: some View {
        Image(systemName: "pencil.circle.fill")
//            .symbolRenderingMode(.palette)
//            .foregroundStyle(.blue, .brown)
            //.font(.largeTitle)
            .font(.system(size: 120))
            //.frame(width: 100, height: 100)
            .clipped()
            //.foregroundStyle(Gradient(colors: [.red, .yellow, .primary]))
    }
}

#Preview {
    IconBootcamp()
}
