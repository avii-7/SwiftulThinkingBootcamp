//
//  MaterialsBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 23/01/25.
//

/* Notes:
  Materials are used to provide blur effect as a background.
    Currently, There are 5 effects available.
 */

import SwiftUI

struct MaterialsBootcamp: View {
    
    var body: some View {
        content
            .background(.blue.opacity(0.3))
            .overlay {
                overlayContent
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 15))
                    .shadow(radius: 3, y: 3)
            }
    }
    
    private var content: some View {
        VStack {
            Image(systemName: "figure.kickboxing")
                .resizable()
                .scaledToFit()
                .font(.headline)
            
            Spacer()
            Image(systemName: "figure.fall")
                .resizable()
                .scaledToFit()
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
    }
    
    private var overlayContent: some View {
        VStack {
            Text("Be Careful !!")
                .font(.largeTitle.bold())
                .foregroundStyle(.blue.opacity(0.8))
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 30)
    }
}

#Preview {
    MaterialsBootcamp()
}
