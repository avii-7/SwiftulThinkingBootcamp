//
//  MultipleSheetBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 19/03/25.
//

// Notes: `content` parameter of `.sheet` modifier is capturing initial value on first present.

import SwiftUI

struct MultipleSheetBootcamp: View {
    
    @State private var showSheet: Bool = false
    
    @State private var selectedPerson: Person = .init(name: "Unknown")
    
    var body: some View {
        VStack(spacing: 30) {
            
            Button("Tom") {
                selectedPerson = Person(name: "Tom")
                showSheet.toggle()
            }
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $showSheet) {
                MyTextView(name: "Tom Sheet: \(selectedPerson.name)")
            }
            
            Button("Jerry") {
                selectedPerson = Person(name: "Jerry")
                showSheet.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $showSheet) {
            MyTextView(name: "Sheet: \(selectedPerson.name)")
        }
//        .sheet(item: $selectedPerson1) { item in
//            Text("You selected \(item.name)")
//        }
    }
}

struct MyTextView: View {
    
    let name: String
    
    init(name: String) {
        self.name = name
        print("Yes Sir")
    }
    
    var body: some View {
        Text("Yooo \(name)")
    }
    
}

#Preview {
    MultipleSheetBootcamp()
}

extension MultipleSheetBootcamp {
    
    struct Person: Identifiable {
        let id = UUID()
        let name: String
    }
}
