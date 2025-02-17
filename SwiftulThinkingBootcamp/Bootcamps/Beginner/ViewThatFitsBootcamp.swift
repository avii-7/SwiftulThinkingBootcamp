//
//  ViewThatFitsBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 05/02/25.
//

/* Learnings 📝
 Use this view if you want to display custom text (or content may be) if current text/content cannot fit
 either horizontally or vertically in the available space..
 
 You can specify alternative content which this view automatically display if previous content
 cannot fit on the screen.
 */

import SwiftUI

struct ViewThatFitsBootcamp: View {
    
    var body: some View {
        VStack {
            verticalExample
        }
        .font(.headline)
        .background(.red)
        .padding(.horizontal)
    }
    
    private var horizontalExample: some View {
        ViewThatFits(in: [.horizontal]) {
            Text("I'm Arun and I'm 25 years old and how are you ?")
            Text("I'm Arun. How are you ?")
        }
        .frame(height: 100)
    }
    
    private var verticalExample: some View {
        ViewThatFits(in: .vertical) {
            Text("I'm Arun and I'm 25 years old and how are you ? How your day is going ?")
            Text("I'm Arun. How are you ?")
        }
        .frame(width: 120, height: 100)
    }
}

#Preview {
    ViewThatFitsBootcamp()
}
