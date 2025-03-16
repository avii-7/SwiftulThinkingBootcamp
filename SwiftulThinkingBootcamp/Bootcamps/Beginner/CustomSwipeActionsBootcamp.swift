//
//  CustomSwipeActionsBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 24/01/25.
//

/* Learnings 📝
 1. You cannot image and title for custom actions at the same time.
 */

import SwiftUI

struct CustomSwipeActionsBootcamp: View {
    
    @State private var vegies = ["Carrot", "Potato", "Cauliflower", "Sweet potato"]
    
    var body: some View {
        List(vegies, id: \.self) {
            Text($0)
                .swipeActions(
                    edge: .leading,
                    allowsFullSwipe: true) {
                        Button {
                            
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        .tint(.red)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button {
                            
                        } label: {
                            VStack {
                                Text("Archive")
                                Image(systemName: "archivebox")
                            }
                            .tint(.green)
                        }
                    }
            
        }
    }
}

#Preview {
    CustomSwipeActionsBootcamp()
}
