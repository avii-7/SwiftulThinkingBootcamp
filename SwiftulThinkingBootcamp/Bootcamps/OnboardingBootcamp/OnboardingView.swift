//
//  OnboardingView.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 17/01/25.
//

/* Strikethrough, overline, underline Code:
 
 .overlay (alignment: .bottom) {
 Capsule(style: .continuous)
 .offset(y: 5)
 .foregroundStyle(.white)
 .frame(height: 3)
 }
 */

import SwiftUI

enum Gender: String, CaseIterable, Identifiable {
    var id: Self { self }
    case male
    case female
}

struct OnboardingView: View {
    
    @State private var onboardingSection: Section = .welcome
    
    @State private var name = ""
    
    @State private var age: Double = 34
    
    @State private var gender: Gender? = nil
    
    @State private var showAlert = false
    
    @State private var alertTitle = ""
    
    @AppStorage("currentUserName") private var currentUserName: String?
    
    @AppStorage("currentUserAge") private var currentUserAge: Int?
    
    @AppStorage("currentUserGender") private var currentUserGender: Gender?
    
    @AppStorage("isUserSignedIn") private var isUserSignedIn = false
    
    private let transition = AnyTransition.asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading)
    )
    
    var body: some View {
        content
            .alert(alertTitle, isPresented: $showAlert) {
                Button("OK") { }
                    .buttonStyle(.borderedProminent)
            }
    }
    
    private var content: some View {
        VStack {
            // content
            Spacer()
            
            switch onboardingSection {
            case .welcome: welcomeSection.transition(transition)
            case .addName: addYourNameSection.transition(transition)
            case .addAge: addAgeSection.transition(transition)
            case .addGender: addGenderSection.transition(transition)
            }
            
            // buttons
            Spacer()
            Spacer()
            bottomButton
        }
    }
}

// Components
extension OnboardingView  {
    
    private var bottomButton: some View {
        Button {
            onButtonPress()
        } label: {
            Text(getButtonText())
                .frame(maxWidth: .infinity)
                .padding()
                .background(.white)
                .clipShape(.rect(cornerRadius: 12))
                .foregroundStyle(.purple)
                .font(.headline.weight(.semibold))
        }
        .animation(nil, value: onboardingSection)
        .padding(.bottom, 20)
        .padding(.horizontal)
    }
    
    private var welcomeSection: some View {
        VStack (spacing: 40) {
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundStyle(.white)
            
            Text("Find your match")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .underline()
            
            Text("This is the #1 app for finding your\nmatch online !")
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
        }
    }
    
    private var addYourNameSection: some View {
        VStack (spacing: 20) {
            
            Text("What's your name?")
                .font(.largeTitle.weight(.semibold))
                .foregroundStyle(.white)
            
            TextField("Your name here...", text: $name)
                .font(.headline)
                .padding()
                .background(.white)
                .clipShape(.rect(cornerRadius: 12))
        }
        .padding(.horizontal, 30)
    }
    
    private var addAgeSection: some View {
        VStack (spacing: 20) {
            
            Text("What's your age?")
                .font(.largeTitle.weight(.semibold))
                .foregroundStyle(.white)
            
            Text(age, format: .number)
                .font(.largeTitle.weight(.semibold))
                .foregroundStyle(.white)
            
            Slider(value: $age, in: 18...50, step: 1)
                .tint(.white)
        }
        .padding(.horizontal, 30)
    }
    
    private var addGenderSection: some View {
        VStack (spacing: 20) {
            
            Text("What's your Gender?")
                .font(.largeTitle.weight(.semibold))
                .foregroundStyle(.white)
            
            Picker("Select your Gender", selection: $gender) {
                ForEach(Gender.allCases) { gender in
                    Text(gender.rawValue.capitalized).tag(gender)
                }
            } currentValueLabel: {
                if let gender {
                    Text(gender.rawValue.capitalized)
                }
                else {
                    Text("Select your Gender")
                }
            }
            .tint(.purple)
            .font(.largeTitle.weight(.semibold))
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(.rect(cornerRadius: 12))
        }
        .padding(.horizontal, 30)
    }
}

// Functions
extension OnboardingView {
    
    private func onButtonPress() {
        
        withAnimation(.linear) {
            switch onboardingSection {
            case .welcome:
                onboardingSection = .addName
            case .addName:
                if isNameValid {
                    onboardingSection = .addAge
                    return
                }
                showAlert(title: "Your name should be atleast 2 characters long")
            case .addAge:
                onboardingSection = .addGender
            case .addGender:
                if isGenderSelected {
                    onSignIn()
                    return
                }
                showAlert(title: "Please select gender before finish")
            }
        }
    }
    
    private func getButtonText() -> String {
        switch onboardingSection {
        case .welcome: "SIGN UP"
        case .addGender: "FINISH"
        default: "NEXT"
        }
    }
    
    private var isNameValid: Bool {
        !name.isEmpty && name.count > 1
    }
    
    private func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
    
    private var isGenderSelected: Bool {
        gender != nil
    }
    
    private func onSignIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        isUserSignedIn = true
    }
}

extension OnboardingView {
    
    private enum Section {
        case welcome, addName, addAge, addGender
    }
}

#Preview {
    OnboardingView()
        .background(.purple )
}


