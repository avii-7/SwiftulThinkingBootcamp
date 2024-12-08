//
//  ToogleBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 04/12/24.
//

/* My Learnings: 📝
 1. Toggle initializer supports systemImage.
 2. You can alos mutate the boolean value of array of type at once with the help of initializer that contains `sources` parameter.
 2. There is one more cool toggle style `button`.
 
 Pending:
 1. Title and subtitle Label
 2. Toggle with sources.
 */

struct Person: Hashable, Identifiable {
    let id = UUID()
    let firstName: String
    var isMale: Bool
}

import SwiftUI

struct ToogleBootcamp: View {
    
    @State private var persons = [
        Person(firstName: "Rahul", isMale: true),
        Person(firstName: "Ginja", isMale: false)
    ]
    
    @State private var toggleIsOn = false
    
    var body: some View {
        VStack {
            toggle2
            
            List {
                ForEach(persons, id: \.self) { item in
                    Text("\(item.firstName) \(item.isMale)")
                }
            }
        }
    }
    
    private var toggle1: some View {
        Toggle("Account Status", systemImage: "smallcircle.filled.circle", isOn: $toggleIsOn)
            .toggleStyle(.switch)
            .foregroundStyle(.red)
    }
    
    private var toggle2: some View {
        Toggle("Account Status", systemImage: "smallcircle.filled.circle", sources: $persons, isOn: \.isMale)
            .toggleStyle(.switch)
            .foregroundStyle(.red)
        
    }
}

#Preview {
    ToogleBootcamp()
        .padding()
}
