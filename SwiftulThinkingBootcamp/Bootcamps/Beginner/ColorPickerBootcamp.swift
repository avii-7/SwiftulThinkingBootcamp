//
//  ColorPickerBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 08/12/24.
//

import SwiftUI

struct ColorPickerBootcamp: View {
    
    @State private var selectedColor: Color = .red
    
    var body: some View {
        ZStack {
            selectedColor
                .ignoresSafeArea()
            
            colorPicker1
        }
    }
    
    private var colorPicker1: some View {
        ColorPicker(selection: $selectedColor, supportsOpacity: true) {
            Text("Select your color")
        }
        .padding()
    }
}


#Preview {
    ColorPickerBootcamp()
}
