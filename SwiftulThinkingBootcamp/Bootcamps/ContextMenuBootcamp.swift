//
//  ContextMenuBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 27/11/24.
//

/* Learnings:
 My Learnings (MD: iOS 18) 📝
  There are three context menu modifiers.
  a. ContextMenu(() -> View) -> (You can attach this with any view)
    (i) You can return buttons, pickers and toggles from context menu closure.

  b. ContextMenu(menuItems: () -> View, preview: () -> View)
   (i) Use this modifier when you want to show custom preview when context menu opens, the original view will hide.

  c. contextMenu(forSelectionType:menu)
   (i) Use with list type to open special context menu for a specific list item(s) selection.

 Miscellaneous:
  * You can create nested menus with `Menu`.
  * You can combine multiple actions using `ControlGroup`. (cool one)
  * You can change the shape of a specific view when context menu opens using .contentShape(kind:shape:) modifier.
 */


import SwiftUI

struct ContextMenuBootcamp: View {
    
    @State private var autoJoin = false
    
    private var colors = ZunuColor.colors
    
    @State private var selections =  Set<ZunuColor.ID>()
    
    @State private var selectedColor = ZunuColor.colors.first!
    
    var body: some View {
        contextMenu2
    }
    
    private var contextMenu1: some View {
        content
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
                        ForEach(colors, id: \.id) { color in
                            Text(color.name)
                        }
                    }
                }
            }
    }
    
    private var contextMenu2: some View {
        content
            .contextMenu {
                Button {
                    
                } label: {
                    Text("Forgot this network")
                }
                
                Button {
                    
                } label: {
                    Label("Disconnet", systemImage: "wifi.slash")
                }
            }
        preview: {
            Image(systemName: "flame")
        }
    }
    
    private var contextMenu3: some View {
        content
            .contextMenu {
                Menu("Menu Header", systemImage: "flame") {
                    Button {
                        
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    Menu("Format Actions") {
                        Button {
                            
                        } label: {
                            Label("Copy", systemImage: "document.on.document")
                        }
                        
                        Button {
                            
                        } label: {
                            Label("Cut", systemImage: "scissors")
                        }
                    }
                } primaryAction: {
                    print("Hey")
                }
        }
    }
    
    private var contextMenu4: some View {
        content
            .contextMenu {
                ControlGroup("Format Opttions", systemImage: "flame") {
                    Button {
                        
                    } label: {
                        Label("Copy", systemImage: "document.on.document")
                    }
                    Button {
                        
                    } label: {
                        Label("Cut", systemImage: "scissors")
                    }
                }
            }
    }
    
    private var contextMenu5: some View {
        NavigationStack {
            List (selection: $selections) {
                ForEach(colors) { item in
                    Text(item.name)
                }
            }
            .contextMenu(forSelectionType: ZunuColor.ID.self) { items in
                if items.isEmpty {
                    Text("Please select some items 😢")
                }
                else if items.count == 1 {
                    Button {
                        
                    } label: {
                        Label("Move", systemImage: "arrow.up.and.down.and.arrow.left.and.right")
                    }
                    
                    Button {
                        
                    } label: {
                        Label("Move", systemImage: "arrow.up.and.down.and.arrow.left.and.right")
                    }
                }
                else {
                    Button {
                        
                    } label: {
                        Label("Move Multiple", systemImage: "arrow.up.and.down.and.arrow.left.and.right")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    private var content: some View {
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
    }
}

#Preview {
    ContextMenuBootcamp()
}

struct ZunuColor: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
}

extension ZunuColor {
    static var colors: [ZunuColor] {
        [
            .init(name: "Red"),
            .init(name: "Blue"),
            .init(name: "Yellow"),
            .init(name: "Green"),
            .init(name: "Purple"),
            .init(name: "Orange"),
        ]
    }
}
