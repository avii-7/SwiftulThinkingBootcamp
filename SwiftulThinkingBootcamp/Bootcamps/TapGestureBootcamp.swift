//
//  TapGestureBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 20/12/24.
//

import SwiftUI

struct TapGestureBootcamp: View {
    
    @State private var isSelected = false
    
    var body: some View {
        VStack (spacing: 30) {
            Rectangle()
                .fill(isSelected ? .red : .green)
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .clipShape(.rect(cornerRadius: 15))
            
            button
            
            textButton
            
            Spacer()
        }
        .padding()
    }
    
    private var button: some View {
        Button {
            isSelected.toggle()
        }
        label: {
            Text("Button")
                .foregroundStyle(.white)
                .padding()
                .background(.blue)
                .clipShape(.rect(cornerRadius: 15))
        }
    }
    
    
    
    private var textButton: some View {
        Text("Text Button")
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 15))
    }
}

#Preview {
    TapGestureBootcamp()
}
