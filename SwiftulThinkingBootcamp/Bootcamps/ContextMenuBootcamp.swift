//
//  ContextMenuBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 27/11/24.
//

/* Topics
 1. There are three context menu modifiers.
    a. ContextMenu(() -> View)
        (i) You can return buttons, pickers and toggles from context menu closure.
        (ii) You can change the shape of a specific view when context menu opens using .contentShape(kind:shape:) modifier.
    b. ContextMenu(menuItems: () -> View, preivew: () -> View)
        (i) Use this modifier when you want to show custom preview when context menu opens.
        (ii) Custom Preview will grow/shrink according to the content you provide.
 */

/* Pending
    1. Try to return picker from menu. (done)
    2. Try to ajust corner radius. (done)
    3. Read official documentation provided by apple. (reading...)
    4. Use different context menus (trying...)
    5. Submenus and Sections.
    6. Control Group
 */

import SwiftUI

struct ContextMenuBootcamp: View {
    
    @State private var autoJoin = false
    
    private var colors: [Color] = [.red, .blue, .green, .yellow, .orange]
    
    @State private var selectedColor = Color.red
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark")
                .font(.title3)
                .foregroundStyle(.blue)
            Text("Ziroh Labs Wifi 1")
                .font(.headline.bold())
            Spacer()
            Image(systemName: "lock.fill")
                .font(.title3)
            Image(systemName: "wifi")
                .font(.title3)
            Image(systemName: "info.circle")
                .font(.title3)
                .foregroundStyle(.blue)
        }
        .foregroundStyle(.white)
        .padding()
        .background(Color.black.clipShape(.rect(cornerRadius: 10)))
        .contentShape(.contextMenuPreview, .rect(cornerRadius: 10))
        .contextMenu {
            Button {
                
            } label: {
                Text("Forgot this network")
            }
            
            Button {
                
            } label: {
                Label("Disconnet", systemImage: "wifi.slash")
            }
            
            Toggle("Auto-Join", isOn: $autoJoin)
            
            Section("Colors") {
                Picker("Colors", selection: $selectedColor) {
                    ForEach(colors, id: \.self) { color in
                        Text(color.description)
                    }
                }
            }
        }
        .contextMenu {
            Button {
                
            } label: {
                Text("Forgot this network")
            }
            
            Button {
                
            } label: {
                Label("Disconnet", systemImage: "wifi.slash")
            }
        } preview: {
            Image(systemName: "flame")
        }

    }
}

#Preview {
    ContextMenuBootcamp()
        .padding()
}
