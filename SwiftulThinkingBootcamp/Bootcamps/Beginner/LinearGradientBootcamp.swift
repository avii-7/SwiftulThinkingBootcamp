//
//  LinearGradientBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 27/09/24.
//

import SwiftUI

struct LinearGradientBootcamp: View {
    var body: some View {
        //        RoundedRectangle(cornerRadius: 5)
        //            //.fill(Color.red)
        //            .fill(LinearGradient(colors: [.yellow, .red, .indigo, .accentColor], startPoint: .topLeading, endPoint: .bottomTrailing))
        //            .frame(width: 300, height: 200)
        
        //        LinearGradient(colors: [.green, Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))], startPoint: .topLeading, endPoint: .bottom)
        //            .frame(width: 300, height: 200)
        
        //        RadialGradient(colors: [.yellow, .pink], center: .trailing, startRadius: 5, endRadius: 200)
        //            .frame(width: 300, height: 200)
        
        AngularGradient(colors: [.pink, .purple], center: .topLeading, startAngle: .degrees(0), endAngle: .degrees(90))
            .frame(width: 300, height: 200)
    }
}

#Preview {
    LinearGradientBootcamp()
}
