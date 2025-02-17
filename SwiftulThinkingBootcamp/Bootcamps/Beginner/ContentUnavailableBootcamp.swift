//
//  ContentUnavailableBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 11/02/25.
//

/* Learnings 📝
 1. If you want to use .searchable Modifier you must have NavigationStack as ParentView.
 2. For best results use ContentUnavailableView as overlay.
 */

import SwiftUI

struct ContentUnavailableBootcamp: View {
    
    private let fruits = ["Apples", "Bananas", "Oranges", "Mangoes"]
    
    @State private var searchText = ""
    
    var body: some View {
        content
            .searchable(text: $searchText, placement: .navigationBarDrawer)
    }
    
    private var content: some View {
        List (searchResults, id: \.self) { fruit in
            LabeledContent(fruit, value: "0 Cal")
        }
        .overlay {
            if searchResults.isEmpty {
                ContentUnavailableView {
                    Label("No search results for \"\(searchText)\"", systemImage: "magnifyingglass")
                } description: {
                    Text("Check the spelling or try a new search")
                } actions: {
                    Button("Go to Home") { }
                }
            }
        }
    }
    
    private var searchResults: [String] {
        if searchText.isEmpty {
            fruits
        }
        else {
            fruits.filter { $0.contains(searchText) }
        }
    }
}

#Preview {
    NavigationStack {
        ContentUnavailableBootcamp()
    }
}
