//
//  FrameBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 29/09/24.
//

import SwiftUI

struct FrameBootcamp: View {
    var body: some View {
        Text("Hello World")
            .background(.red)
            .frame(width: 100, height: 100, alignment: .center)
            .background(.yellow)
            .frame(width: 150, height: 150, alignment: .topLeading)
            .background(.green)
            .frame(width: 200, height: 200, alignment: .topLeading)
            .background(.blue)
            .frame(width: 250, height: 250, alignment: .topLeading)
            .background(.indigo)
    }
}

#Preview {
    FrameBootcamp()
}
