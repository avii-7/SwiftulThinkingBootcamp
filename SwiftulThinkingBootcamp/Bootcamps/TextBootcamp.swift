//
//  Bootcamp2.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 21/09/24.
//

import SwiftUI

struct Bootcamp2: View {
    
    private let localize = LocalizedStrings()
    
    var body: some View {
        Text("Hello World")
            .font(.custom("Poppins-Bold", size: 34, relativeTo: .largeTitle))
            .baselineOffset(111)
//            .lineSpacing(30)
            .underline()
        
    }
}

#Preview {
    Bootcamp2()
}
