//
//  StacksBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 05/10/24.
//

import SwiftUI

struct StacksBootcamp: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                let colors: [Color] = [.red, .green, .yellow, .brown, .blue, .black, .purple, .cyan, .gray]
                
                LazyHStack {
                    ForEach (colors, id: \.self) { color in
                        Rectangle()
                            .fill(color)
                            .frame(width: 300)
                            .onAppear {
                                print(color.description)
                            }
                    }
                }
                .padding()
            }
            .frame(height: 300)
            Spacer()
            
//            Rectangle()
//                .fill(Color.green)
            //Spacer()
        }
    }
}

#Preview {
    StacksBootcamp()
}
