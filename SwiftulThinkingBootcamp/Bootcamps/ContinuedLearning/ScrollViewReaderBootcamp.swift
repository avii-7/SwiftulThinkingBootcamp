//
//  ScrollViewReaderBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 17/03/25.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    
    @State private var enteredText: String = ""
    
    var body: some View {
        content2
    }
    
    private var content: some View {
        ScrollView {
            ScrollViewReader { proxy in
                
                Button {
                    withAnimation(.spring) {
                        proxy.scrollTo(14, anchor: .center)
                    }
                } label: {
                    Text("Scroll to bottom")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.ultraThinMaterial)
                        .padding(.top, 1)
                }
                
                ForEach (0..<25) { index in
                    Text("\(index)")
                        .font(.headline)
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .background(.blue.opacity(0.5))
                        .clipShape(.rect(cornerRadius: 12))
                        .shadow(radius: 10)
                        .padding()
                        .id(index)
                }
            }
        }
//        .safeAreaInset(edge: .top) {
//            Text("Header")
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(.ultraThinMaterial)
//                .padding(.top, 1)
//        }
    }
    
    private var content2: some View {
        ScrollViewReader { proxy in
            
            VStack (spacing: 20) {
                TextField("Enter a number here", text: $enteredText)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                
                Button("Scroll") {
                    if let number = Int(enteredText) {
                        withAnimation(.spring) {
                            proxy.scrollTo(number, anchor: .top)
                        }
                    }
                }
                .fontWeight(.semibold)
                .textCase(.uppercase)
                .foregroundStyle(.white)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(.blue.opacity(0.5))
                .clipShape(.rect(cornerRadius: 10))
                .disabled(enteredText.isEmpty)
            }
            .padding(.horizontal)
            
            ScrollView {
                ForEach (0..<25) { index in
                    Text("\(index)")
                        .font(.headline)
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .background(.blue.opacity(0.5))
                        .clipShape(.rect(cornerRadius: 12))
                        .shadow(radius: 10)
                        .padding()
                                            .id(index)
                }
            }
        }
//        .safeAreaInset(edge: .top) {
//            Text("Header")
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(.ultraThinMaterial)
//                .padding(.top, 1)
//        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}
