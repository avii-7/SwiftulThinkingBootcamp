//
//  PopoverBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 21/11/24.
//

import SwiftUI

struct PopoverBootcamp: View {
    
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            Button("Show Sheet") {
                showSheet.toggle()
            }
            .font(.title3)
            .tint(Color.white)
            .padding()
            .background(Color.black)
            .clipShape(.capsule)
            .padding(.top)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.blue.ignoresSafeArea())
        // Method 1 -> Sheet
        //        .sheet(isPresented: $showSheet) {
        //            Screen2()
        //        }
        .overlay {
            // Method 2 - Transition and View Hierarcy
            if showSheet {
                Screen3(showSheet: $showSheet)
                    .padding(.top)
                    .transition(.move(edge: .bottom))
            }
            
            // Method 3 - Animation and offset
//            Screen3(showSheet: $showSheet)
//                .padding(.top)
//                .offset(y: showSheet ? 0 : UIScreen.main.bounds.height)
//                .animation(.easeOut, value: showSheet)
        }
        // METHOD - 2
         .animation(.spring, value: showSheet)
    }
}

#Preview {
    PopoverBootcamp()
}


struct Screen2 : View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Color.purple.opacity(0.5)
            .ignoresSafeArea()
            .overlay(alignment: .topLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title.bold())
                        .padding([.leading, .top])
                        .tint(Color.black)
                }
            }
    }
}

struct Screen3 : View {
    
    @Binding var showSheet: Bool
    
    var body: some View {
        Color.purple
            .ignoresSafeArea()
            .overlay(alignment: .topLeading) {
                Button {
                    showSheet.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title.bold())
                        .padding([.leading, .top])
                        .tint(Color.black)
                }
            }
    }
}
