//
//  AppStorageBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 15/01/25.
//

import SwiftUI

struct AppStorageBootcamp: View {
    
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    
    var body: some View {
        VStack {
            Toggle(
                isDarkModeEnabled ? "Dark Mode": "Light Mode",
                systemImage: isDarkModeEnabled ? "sun.min": "sun.max.fill",
                isOn: $isDarkModeEnabled
            )
        }
        .foregroundStyle(isDarkModeEnabled ? .white: .black)
        .frame(maxHeight: .infinity)
        .padding()
        .background(isDarkModeEnabled ? .black: .white)
    }
}

#Preview {
    AppStorageBootcamp()
}
