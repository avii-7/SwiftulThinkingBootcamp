//
//  AlertBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 24/11/24.
//

/* Topics */

/*
 Fun facts: 🤗
 1. You can create as many buttons as you can for alert.
 2. Every button tap will dismiss the alert.
 3. You can't get rid of the 'Cancel' button, it will always be there. Either this will be provided by the system or by your `role: .cancel` button.
 */

import SwiftUI

struct AlertBootcamp: View {
    
    @State private var showAlert = false
    
    @State private var action: MyAction? = nil
    
    private enum MyAction {
        case success, failure
        
        var title: String {
            switch self {
            case .success: "Success 🎉"
            case .failure: "Failure 😰"
            }
        }
    }
    
    var body: some View {
        VStack {
            Button("Show Alert") {
                action = .success
                showAlert.toggle()
            }
        }
        //        .alert("Success  🎊", isPresented: $showAlert) {
        //            Button("Delete", role: .destructive) {
        //                print("Nice")
        //            }
        //        }
        .alert(
            "Success 2",
            isPresented: $showAlert,
            presenting: action
        ) { action in
            
            ForEach(1...2, id: \.self) { _ in
                Button("Delete", role: .destructive) {
                    print("Delete")
                }
                
                
            }
            Button("Cancel") {
                print("Cancel")
            }
        }
    }
}

#Preview {
    AlertBootcamp()
}
