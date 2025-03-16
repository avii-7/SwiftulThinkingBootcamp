//
//  ObservableBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 14/02/25.
//

import SwiftUI
import Observation

struct ObservableBootcamp: View {
    
    @State private var viewModel = ObservableViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List (viewModel.fruits, id: \.self) { fruit in
                    Text(fruit)
                        .font(.title3)
                }
                
                SecondView(viewModel: viewModel)
                
                ThridView()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.fruits.append("Pineapple")
                    } label: {
                        Image(systemName: "plus")
                            .fontWeight(.bold)
                            .tint(.black)
                    }
                }
            }
            .navigationTitle("Fruits")
        }
        .environment(viewModel)
    }
}

#Preview {
    ObservableBootcamp()
}

@Observable
final class ObservableViewModel {
    
    var fruits = ["Apples", "Bananas", "Oranges"]
    
    @ObservationIgnored var favoriteFruit: String = "Apple"
}

struct SecondView: View {
    
    var viewModel: ObservableViewModel
    
    var body: some View {
        List(viewModel.fruits, id: \.self) { fruit in
            Text(fruit)
                .font(.headline)
        }
        
        Button("Mutate") {
            viewModel.fruits.append("Pineapple2")
        }
    }
}

struct ThridView: View {
    
    @Environment(ObservableViewModel.self) var viewModel
    
    var body: some View {
        Text(viewModel.favoriteFruit)
    }
}
