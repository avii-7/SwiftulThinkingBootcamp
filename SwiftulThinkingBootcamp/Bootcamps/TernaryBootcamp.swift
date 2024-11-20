//
//  TernaryBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 13/11/24.
//

import SwiftUI

struct TernaryBootcamp: View {
    
    @State private var state: ProgramState = .end
    
    var body: some View {
        VStack {
            Button("Switch State: \(state)") {
                switch state {
                case .start: state = .middle
                case .middle: state = .end
                case .end: state = .start
                }
            }
            RoundedRectangle(cornerRadius: 5).frame(width: 100, height: 100)
                .foregroundStyle ({
                    switch state {
                    case .start: return Color.red
                    case .middle: return Color.blue
                    case .end: return Color.green
                    }
                }())
        }
    }
}

extension TernaryBootcamp {
    
    private enum ProgramState {
        case start, middle, end
    }
}

#Preview {
    TernaryBootcamp()
}
