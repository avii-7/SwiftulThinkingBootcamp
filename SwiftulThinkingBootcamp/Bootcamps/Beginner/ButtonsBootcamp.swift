//
//  ButtonsBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 09/11/24.
//

/* Learnings:
 1. You can use button styles for button look and feel.
 2. By default button text is visible in accent color, you can use `.buttonStyle(.plain)` to
    remove that.
 3. You can use .controlSize() modifier to add padding around buttons
 */

import SwiftUI

struct ButtonsBootcamp: View {
    var body: some View {
//        HStack(spacing: 20) {
//            button1
//            button2
//        }
        
        VStack {
            button3
            button4
            button5
        }
    }
    
    private var button1: some View {
        // Scale Effect on button press.
        Button {
            
        } label: {
            Circle()
                .fill(Color.white)
                .frame(width: 100, height: 100)
                .shadow(radius: 4)
                .overlay {
                    Image(systemName: "heart.fill")
                        .font(.largeTitle)
                }
        }
        .buttonStyle(ScaleButtonStyle())
    }
    
    private var button2: some View {
        // Scale Effect on button press.
        Button {
            
        } label: {
            Image(systemName: "heart.fill")
                .font(.largeTitle)
                .padding(.all, 35)
                .background(alignment: .center) {
                    Circle()
                        .fill(Color.white)
                        .shadow(radius: 4)
                }
        }
        .foregroundStyle(.blue)
        .buttonStyle(ScaleButtonStyle())
    }
    
    private var button3: some View {
        Button("Press me") {
            
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.extraLarge)
    }
    
    private var button4: some View {
        Button("Press me") {
            
        }
        .buttonStyle(.bordered)
    }
    
    private var button5: some View {
        Button("Press me") {
            
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ButtonsBootcamp()
}

struct ScaleButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label.scaleEffect(configuration.isPressed ? 0.9 : 1)
        
    }
}
