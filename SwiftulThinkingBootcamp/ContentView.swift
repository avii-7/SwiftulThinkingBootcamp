//
//  ContentView.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 19/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Execute") {
                let bootcamp = PrintSeriesBootcamp()
                bootcamp.execute()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
