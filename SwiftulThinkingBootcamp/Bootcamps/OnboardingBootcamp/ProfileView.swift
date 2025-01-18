//
//  ProfileView.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 18/01/25.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("currentUserName") private var currentUserName: String?
    
    @AppStorage("currentUserAge") private var currentUserAge: Int?
    
    @AppStorage("currentUserGender") private var currentUserGender: Gender?
    
    @AppStorage("isUserSignedIn") private var isUserSignedIn = false
    
    var body: some View {
        VStack (spacing: 15) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text(currentUserName ?? "Your name here")
            
            Text("Your age is: \(currentUserAge ?? -1)")
            
            Text("Your gender is: \(currentUserGender?.rawValue.capitalized ?? "unknown")")
            
            Button {
                signOut()
            } label: {
                Text("SIGN OUT")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .padding()
                    .background(.red.opacity(0.9))
                    .clipShape(.rect(cornerRadius: 10))
            }
            .padding(.top)
        }
        .font(.title)
        .padding(30)
        .foregroundStyle(.purple)
        .background(.white)
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 2.5, y: 2 )
    }
    
    private func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        isUserSignedIn = false
    }
}

#Preview {
    ProfileView()
}
