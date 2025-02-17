//
//  GroupBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 31/01/25.
//

import SwiftUI
/* Learnings: 📝
 -> Use a group to collect multiple instances without effecting the layout of those views.
 -> You can use modifiers on Groups to remove duplicate codes that you will apply on individual views.
 */

struct GroupBootcamp: View {
    
    var body: some View {
        content2
    }
    
    private var content: some View  {
        VStack(spacing: 30) {

            Text("Hello world 1")
            
            Group {
                Text("Hello world 2")
                Text("Hello world 3")
            }
        }
        .foregroundStyle(.red)
        .font(.headline)
    }
    
    private var content2: some View  {
        HStack(spacing: 0) {

            Spacer()
            
            Text("1")
            
            Spacer()
            
            Group {
                Text("2")
                
                Spacer()
                
                Text("3")
            }
            
            Spacer()
        }
        .foregroundStyle(.red)
        .font(.headline)
    }
}

#Preview {
    GroupBootcamp()
}
