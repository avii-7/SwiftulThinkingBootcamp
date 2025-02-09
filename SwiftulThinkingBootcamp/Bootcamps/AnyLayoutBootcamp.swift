//
//  AnyLayoutBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 04/02/25.
//

/* Learnings 📝
 1. Use horizontal/vertical size classes to take decision to adjust views based on space available.
 2. Use AnyLayout if you want to layout content based on sizeClasses value.
 
 Observations:
 1. Only Pro Max and iPad devices return horizontal size class value as regular in landscape mode.
 */

import SwiftUI

struct AnyLayoutBootcamp: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        VStack {
            let layout = horizontalSizeClass == .regular ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
            
            layout {
                Text("Hey ")
                Text("I'm ")
                Text("Arun")
            }
        }
    }
}

#Preview {
    AnyLayoutBootcamp()
}
