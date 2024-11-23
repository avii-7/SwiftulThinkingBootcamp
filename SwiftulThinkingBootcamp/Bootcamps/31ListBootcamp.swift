//
//  31ListBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 23/11/24.
//

/** LISTS 📋: Topics
 1. Sections with headers and collapsables.
 * Section(_:isExpanded: Content) disclosure icon only visible when used with listStyle(.sidebar)
 2. Embed in Navigation Stack and Add EditButton in navigation Toolbar
 * EditButton() alter the enviornment edit value and List is already configured to react to changes on edit env value. You can also alter the env edit value and also create custom views that will react to the changes.
 3. Append new items using Navigation Bar trailing button
 4. Try different list styles
 5. Accent colors on different views (parent/child)
 * Accent Color is deprecated, use foreground color
 * Add accent color in assets, all the app button color will convert to that color.
 6. List row background modifier
 */

import SwiftUI

struct ListBootcamp: View {
    
    @State private var fruits = ["Apple", "Banana", "Orange", "Peach", "Graphes"]
    
    @State private var vegies = ["Carrot", "Potato", "Cauliflower", "Sweet potato"]
    
    @State private var isFruitsExpanded = true
    
    @State private var isVegiesExpanded = true
    
    var body: some View {
        NavigationStack {
            content
                .listStyle(.sidebar)
                .navigationTitle("ListBootcamp")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) { EditButton() }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add", systemImage: "plus", action: addVegie)
                    }
                }
        }
    }
}

extension ListBootcamp {
    private var content: some View {
        List {
            Section(isExpanded: $isVegiesExpanded) {
                ForEach(vegies, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: onDelete)
                .onMove(perform: onMove)
            }
            header: {
                Label("Vegies", systemImage: "flame.fill")
            }
            
            Section("Fruits", isExpanded: $isFruitsExpanded) {
                ForEach(fruits, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}

extension ListBootcamp {
    private func onDelete(indexSet: IndexSet) {
        vegies.remove(atOffsets: indexSet)
    }
    
    private func onMove(fromOffsets: IndexSet, toOffset: Int) {
        vegies.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
    
    private func addVegie() {
        vegies.append("Cabbage")
    }
}

#Preview {
    ListBootcamp()
}
