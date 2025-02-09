//
//  ToolbarBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 29/01/25.
//

/* Learnings 📝
  1. Use toolbarItemPlacement = .principal to place the custom content in the middle of navigation bar.
 2. Use toolbarTitleMenu to add a menu to the toolbar's title.
 3. You can add buttons to the keyboard bar using placement type keyboard.
 4. Use .toolbar(removing: ToolbarDefaultItemKind.title) to remove title.
 */

import SwiftUI

struct ToolbarBootcamp: View {
    
    @State private var name = ""
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Toolbar bootcamp")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(removing: ToolbarDefaultItemKind.title)
                .toolbarTitleMenu {
                    Button("Screen 1") {
                        
                    }
                    
                    Button ("Screen 2") {
                        
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image(systemName: "flame.circle")
                    }
//                    ToolbarItem(placement: .principal) {
//                        Image(systemName: "wind")
//                    }
                    
                    ToolbarItem(placement: .navigation) {
                        Image(systemName: "umbrella")
                    }
                    
                    ToolbarItem(placement: .keyboard) {
                        Button("Done") {
                            
                        }
                    }
                }
                .alert("Are you sure ?", isPresented: $showAlert) {
                    Button("OK") {
                        
                    }
                }
        }
    }
    
    private var content: some View {
        ScrollView {
            VStack {
                TextField("Enter your name", text: $name)
                
                Button("Show Alert") {
                    showAlert.toggle()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ToolbarBootcamp()
}
