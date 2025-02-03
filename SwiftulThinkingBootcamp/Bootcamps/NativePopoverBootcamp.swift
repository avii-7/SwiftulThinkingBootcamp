//
//  NativePopoverBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 03/02/25.
//

import SwiftUI

struct NativePopoverBootcamp: View {
    
    @State private var showPopover = false
    
    @State private var enableDarkMode = false
    
    var body: some View {
        content
    }
    
    private var content: some View {
        VStack {
            Button("Show Popover", systemImage: "arrow.up.circle.fill") {
                showPopover.toggle()
            }
            .popover(isPresented: $showPopover, attachmentAnchor: .point(.top)) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Menu("Options") {
                        Button("Flame", systemImage: "flame") {
                            
                        }
                        
                        Button("Forest", systemImage: "leaf") {
                            
                        }
                        
                        Toggle("Dark Mode", systemImage: "sun.min", isOn: $enableDarkMode)
                    }
                    
                    Button("Flame", systemImage: "flame") {
                        
                    }
                    
                    Button("Forest", systemImage: "leaf") {
                        
                    }
                    
                    Toggle("Dark Mode", systemImage: "sun.min", isOn: $enableDarkMode)
                }
                .padding()
                .presentationCompactAdaptation(.popover)
            }
        }
    }
}

#Preview {
    NativePopoverBootcamp()
}
