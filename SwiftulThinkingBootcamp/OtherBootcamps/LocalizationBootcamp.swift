//
//  LocalizationBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 21/09/24.
//

import SwiftUI

struct LocalizationBootcamp: View {
    
    private let localize = LocalizedStrings()
    
    let company: String = "Apple"
        let one: Int = 1
        let ten: Int = 10
        let distance: Double = 1.234567
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text(localize.WELCOME(arg: "Ajay"))
            
            Text("No Localization")
            
            Text("Hello, \(company)!")
            
            Text("I love you 💕")
            
            Text("\(one) item(s)")
            
            Text("\(ten) item(s)")
            
            Text("Distance: \(distance) km")
        }
        .padding(.vertical, 30)
    }
}

#Preview {
    LocalizationBootcamp()
}
