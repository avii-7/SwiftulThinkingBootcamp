//
//  NavigationSplitViewBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 07/02/25.
//

/* Learnings 📝
 1. Use NavigationSplitViewStyle(.prominentDetail/.balanced) when you want to or don't want to apply shadow on detail view when
    sidebar is open.
 2. Use NavigationLink(_,value:) to remain highlighted the value of sidebar.
 3. Use whole struct as selectable type which should also conform to Identificable & Hashable.
 */

import SwiftUI

struct NavigationSplitViewBootcamp: View {
    
    @State private var selectedFruit: Fruit? = nil
    
    @State private var navigationSplitViewVisibility = NavigationSplitViewVisibility.doubleColumn
    
    @State private var fruits = [
        Fruit(name: "Apple"),
        Fruit(name: "Banana"),
        Fruit(name: "Orange"),
        Fruit(name: "Pineapple")
    ]
    
    var body: some View {
        NavigationSplitView (columnVisibility: $navigationSplitViewVisibility) {
            List (fruits, selection: $selectedFruit) { fruit in
                
                // 1
//                NavigationLink(fruit.name, value: fruit)
                
                // 2
                Button {
                    selectedFruit = fruit
                } label: {
                    Text(fruit.name)
                }
            }
        } detail: {
            if let selectedFruit {
                Text("Your selected fruit is: \(selectedFruit.name)")
            }
            else {
                Text("No fruit selected !!")
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    NavigationSplitViewBootcamp()
}

//enum Fruit: String, CaseIterable, Identifiable, Hashable {
//    
//    var id: String { self.rawValue }
//    
//    case apple, banana, orange, pineapple
//}

struct Fruit: Identifiable, Hashable {
    
    let id: UUID
    
    let name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
