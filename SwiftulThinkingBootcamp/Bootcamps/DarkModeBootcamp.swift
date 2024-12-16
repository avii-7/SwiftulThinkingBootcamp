//
//  DarkModeBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 14/12/24.
//

import SwiftUI

struct DarkModeBootcamp: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack (spacing: 25) {
            
            Text("This is primary text view")
                .foregroundStyle(.primary)
                .padding(.top, 30)
            
            Text("This is secondary text views")
                .foregroundStyle(.secondary)
            
            Text("This is tertiary Text view")
                .foregroundStyle(.tertiary)
            
            Text("This is red text view")
                .foregroundStyle(.red)
            
            Text("This is red secondary text view")
                .foregroundStyle(.red.secondary)
            
            Text("Adaptable Color Text View")
                .foregroundStyle(colorScheme == .light ? .black : .white)
            
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        DarkModeBootcamp()
            .preferredColorScheme(.light)
            .navigationTitle("Dark Mode Bootcamp")
    }
    
}
