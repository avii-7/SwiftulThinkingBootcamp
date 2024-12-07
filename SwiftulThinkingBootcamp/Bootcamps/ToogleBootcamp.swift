//
//  ToogleBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 04/12/24.
//

/* My Learnings: 📝
 1. Toggle initializers supports `systemImage`.
 2. You can also mutate the boolean value of array of type at once with the help of initializers that contains `sources` as a parameter.
 3. There is one more cool toggle style `button`.
 4. You can create custom toggle styles views like checkbox using `ToggleStyle` protocol.
 
 Pending:
 1. Title and subtitle label (done)
 2. Toggle with sources. (done)
 3. ToggleStyle with Configuration. (done)
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
            toggle3
            
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
    
    private var toggle3: some View {
        Toggle("Account Status 3", isOn: $toggleIsOn)
            .toggleStyle(MixStateToggleStyle())
            .foregroundStyle(.red)
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                Image(systemName: configuration.isOn ? "circle.fill" : "circle")
                configuration.label
            }
        }
        .buttonStyle(NoTapAnimationStyle())
    }
}

struct MixStateToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Image(
                systemName: configuration.isMixed
                ? "minus.circle.fill" : configuration.isOn
                ? "checkmark.circle.fill" : "circle.fill")
            configuration.label
        }
    }
}

extension ToggleStyle where Self == CheckboxToggleStyle {
    static var checkbox: CheckboxToggleStyle { .init() }
}

#Preview {
    ToogleBootcamp()
        .padding()
}

struct NoTapAnimationStyle: PrimitiveButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .contentShape(.rect)
            .onTapGesture(perform: configuration.trigger)
    }
    
}
