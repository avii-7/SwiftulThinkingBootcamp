//
//  ConfirmationDialogBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 25/11/24.
//

/* Notes: ConfirmationDialog
 Similar to alerts and sheets but it is less customizable.
 Customizable is only limited to adding textViews (for title and message) and buttons.
 But presentation is similar to the sheets (from bottom to top).
 */

import SwiftUI

struct ConfirmationDialogBootcamp: View {
    
    @State private var showDialog = false
    
    @State private var showDialog2 = false
    
    var body: some View {
        content
    }
    
    private var content: some View {
        VStack {
            Button("Show") {
                //                showDialog.toggle()
                showDialog2.toggle()
            }
        }
        .confirmationDialog("Are you sure ?", isPresented: $showDialog, titleVisibility: .visible) {
            Button("Delete", role: .destructive) {
                
            }
        }
        .confirmationDialog("Are you sure ?", isPresented: $showDialog2) {
            Button("Cancel", role: .cancel) {
                
            }
        } message: {
            Label("You are about to delete the item", systemImage: "trash")
        }
    }
    
    private var content2: some View {
        RoundedRectangle(cornerRadius: 5)
            .aspectRatio(1.0, contentMode: .fit)
    }
}

#Preview {
    ConfirmationDialogBootcamp()
}
