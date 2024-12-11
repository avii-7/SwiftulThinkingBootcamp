//
//  SliderBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 11/12/24.
//

/* Learnings 📝
 1. Slider only works with BinaryFloatingPointNumber (Double)
 2. Slider can work with range.
 3. You can also add step-up. If you specified Interger step-up, you can `.number` format for removing decimal digits.
 */

import SwiftUI

struct SliderBootcamp: View {
    
    @State private var value = 0.0
    
    var body: some View {
        VStack {
//            slider1
//            slider2
//            slider3
            slider4
//            Text("\(value)")
            Text(value, format: .number)
        }
    }
    
    private var slider1: some View {
        Slider(value: $value)
    }
    
    // Slider with Range
    private var slider2: some View {
        Slider(value: $value, in: 0...10)
    }
    
    // Slider with Range and step-up
    private var slider3: some View {
        Slider(value: $value, in: 0...10, step: 1)
    }
    
    private var slider4: some View {
        Slider(value: $value, in: 0...10, step: 1) { }
        minimumValueLabel: {
            Image(systemName: "sun.min")
        } maximumValueLabel: {
            Image(systemName: "sun.max.fill")
        }
    }
}

#Preview {
    SliderBootcamp()
        .padding()
}
