//
//  StepperBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 10/12/24.
//

import SwiftUI

struct StepperBootcamp: View {
    
    @State var count: Int = 0
    
    var body: some View {
        VStack {
            stepper1
            stepper2
        }
    }
    
    private var stepper1: some View {
        Stepper("Count: \(count)", value: $count)
    }
    
    private var stepper2: some View {
        Stepper(value: $count, in: 0...10, step: 5) {
            Text("Count: \(count)")
        }
    }
}

#Preview {
    StepperBootcamp()
        .padding()
}
