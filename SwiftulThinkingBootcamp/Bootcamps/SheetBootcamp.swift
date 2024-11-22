//
//  SheetBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 20/11/24.
//

import SwiftUI

extension Int : Identifiable {
    
    public var id: Int { self }
}

struct SheetBootcamp: View {
    
    @State private var showSheet = false
    
    @State private var item = Optional<Int>(nil)
    
    var body: some View {
        VStack {
            Button("ShowSheet") {
                showSheet.toggle()
//                item = .random(in: 0...10)
            }
            .sheet(isPresented: $showSheet) {
                Color.red
                    .ignoresSafeArea()
                    .presentationDetents([.fraction(0.1), .medium, .large])
                    .presentationDragIndicator(.hidden)
            }
            .sheet(item: $item) { item in
                Text("item is \(item)")
            }
            
//            .fullScreenCover(isPresented: $showSheet) {
//                Text("item")
//                    .background(Color.blue)
//            }
        }
    }
}

#Preview {
    SheetBootcamp()
}
