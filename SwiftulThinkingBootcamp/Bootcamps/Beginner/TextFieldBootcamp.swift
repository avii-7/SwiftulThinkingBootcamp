//
//  TextFieldBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 01/12/24.
//

/* My Learnings:
 1. You can take advantage of `.format` paramter of textfield initializer for using inbuild formattings. Like:
    a. Use PersonNameComponents instance as binding with `.name` format for better name structring.
    b. Use double as binding and then pass .currency(name) as a parameter to show currecy symbol.
 2. You can create a textfield that grow vertically by using `axis` modifier in the initializer.
 3. You can also customize submit label in keyboard.
 */

import SwiftUI

struct TextFieldBootcamp: View {
    
    @State private var text = ""
    
    @State private var nameComponents = PersonNameComponents()
    
    @State private var dataArray: [String] = []
    
    @State private var number: Double = 0
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                TextField("Enter your email address", text: $text)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Enter your name", value: $nameComponents, format: .name(style:.medium))
                
                TextField.init("Your amount", value: $number, format: .currency(code: "INR"))
                    .submitLabel(.go)
                
                TextField(text: $text, axis: .vertical) {
                    Text("Enter your favorite game")
                        .foregroundStyle(.blue)
                }
                
                Button {
                    if isValid() {
                        addData()
                    }
                } label: {
                    HStack {
                        Text("Add")
                        Image(systemName: "plus.circle")
                    }
                    .padding(10)
                    .background(Color.gray.opacity(0.3).clipShape(.rect(cornerRadius: 10)))
                }
                .disabled(!isValid())

                ForEach(dataArray, id: \.self) { item in
                    Text(item)
                }
                Spacer()
            }
            .padding()
            .navigationTitle("TextField Bootcamp !!!")
        }
       
    }
    
    private func addData() {
        dataArray.append(text)
    }
    
    private func isValid() -> Bool {
        text.count > 3
    }
}

#Preview {
    TextFieldBootcamp()
}
