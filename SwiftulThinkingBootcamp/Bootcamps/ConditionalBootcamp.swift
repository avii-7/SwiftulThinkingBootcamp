//
//  ConditionalBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 12/11/24.
//

import SwiftUI

struct ConditionalBootcamp: View {
    
    @State private var showView = false
    
    var body: some View {
        VStack {
            if showView {
                Text("Hello world")
                    .onAppear {
                        print("Hello world text view")
                    }
            }
            else {
                ProgressView("Nice to have you here")
            }
            Button("Show \(showView)") {
                showView.toggle()
            }
            .onAppear {
                print("Execute")
            }
            
            getView(val: true.description)
        }
    }
    
    @ViewBuilder
    func getView(val: String) -> some View {
        Text.init(val)
    }
}

#Preview {
    ConditionalBootcamp()
}
