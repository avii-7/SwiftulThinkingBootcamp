//
//  BackgroundAndOverlayBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 01/10/24.
//

import SwiftUI

struct BackgroundAndOverlayBootcamp: View {
    var body: some View {
        VStack {
            ScrollView {
                header
            }
            footer
        }
//        .frame(maxHeight: .infinity)
//        .background(alignment: .bottom) {
//            
//        }
    }
    
    private var header: some View {
        HStack {
            Text("Hello, World!")
            Image(systemName: "house")
        }
        .foregroundStyle(.green)
        .font(.largeTitle)
    }
    
   private var footer: some View {
       Button {
           
       } label: {
           Image(systemName: "plus")
               .font(.largeTitle)
               .tint(.purple)
       }
    }
}

#Preview {
    BackgroundAndOverlayBootcamp()
}
