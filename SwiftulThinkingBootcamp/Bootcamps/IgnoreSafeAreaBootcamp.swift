//
//  IgnoreSafeAreaBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 04/11/24.
//

import SwiftUI

struct IgnoreSafeAreaBootcamp: View {
    var body: some View {
        parentViewWithColor
    }
    
    private var parentViewWithColor: some View {
        VStack {
            Text("Hello World")
                .frame(maxWidth: .infinity)
                .background(.blue)
                
            Spacer()
        }
        .background(Color.red)
    }
    
    private var oldContent: some View {
        VStack {
            Text("Hey")
                .font(.largeTitle)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue.opacity(0.2))
        .background(alignment: .bottom) {
            Text("Hey")
        }
    }
}

#Preview {
    IgnoreSafeAreaBootcamp()
}
