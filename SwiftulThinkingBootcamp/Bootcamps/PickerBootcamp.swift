//
//  PickerBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 08/12/24.
//

/* My learnings 📋
 1. You don't need asign tags to picker views when using ForEach becuase it automatically assigns that.
 */

import SwiftUI

struct PickerBootcamp: View {
    
    @State private var selectedColor = Color.red
    
    @State private var colors: [Color] = [.red, .yellow, .green]
    
    var body: some View {
        picker2
    }
    
    private var picker1: some View {
        Picker("Picker", selection: $selectedColor) {
            ForEach(colors, id: \.self) { color in
                Text(color.description)
            }
        }
        .pickerStyle(.segmented)
    }
    
    private var picker2: some View {
        Picker("Nice Picker", systemImage: "fire", selection: $selectedColor) {
            ForEach(colors, id: \.self) { color in
                Text(color.description).tag(color)
            }
        } currentValueLabel: {
            Label("\(selectedColor.description)", systemImage: "fire")
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    PickerBootcamp()
}
