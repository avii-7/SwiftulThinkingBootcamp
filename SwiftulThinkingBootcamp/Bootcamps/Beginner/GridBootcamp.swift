//
//  GridBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 21/10/24.
//

import SwiftUI

struct GridBootcamp: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]


        var body: some View {
             ScrollView {
                 LazyVGrid(columns: columns) {
                     ForEach(0x1f600...0x1f64f, id: \.self) { value in
                         Text(String(format: "%x", value))
                         Text(emoji(value))
                             .font(.largeTitle)
                     }
                 }
             }
        }


        private func emoji(_ value: Int) -> String {
            guard let scalar = UnicodeScalar(value) else { return "?" }
            return String(Character(scalar))
        }
}

#Preview {
    GridBootcamp()
}
