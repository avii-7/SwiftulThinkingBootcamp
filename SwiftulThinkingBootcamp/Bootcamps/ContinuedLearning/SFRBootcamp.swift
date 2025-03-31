//
//  SFRBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 31/03/25.
//

import SwiftUI

struct CarBrand: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let location: String
    let isAvailableInIndia: Bool
}

final class ViewModel: ObservableObject {
    
    var cars: [CarBrand] = [] {
        didSet {
            reset()
        }
    }
    
    @Published var filteredCars: [CarBrand] = []
    
    init() {
        fetchCars()
    }
    
    private func fetchCars() {
        cars = [
            CarBrand(name: "Nishan", location: "Australia", isAvailableInIndia: true),
            CarBrand(name: "Verna", location: "Japan", isAvailableInIndia: false),
            CarBrand(name: "Mustang", location: "USA", isAvailableInIndia: true),
            CarBrand(name: "Ferrari", location: "Paris", isAvailableInIndia: false)
        ]
    }
    
    func showAvailable() {
        filteredCars = filteredCars.filter { $0.isAvailableInIndia }
    }
    
    func sortCarsByName() {
        filteredCars = filteredCars.sorted { $0.name < $1.name }
    }
    
    func reset() {
        filteredCars = cars
    }
}

struct SFRBootcamp: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(viewModel.filteredCars) { car in
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            Text(car.name)
                                .font(.title)
                            Text(car.location)
                                .font(.caption)
                            
                        }
                        Spacer()
                        Image(systemName: car.isAvailableInIndia ? "flame" : "multiply")
                            .font(.title)
                    }
                    .padding()
                    .background(.orange.opacity(0.5))
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.horizontal)
                }
            }
            .animation(.linear, value: viewModel.filteredCars)
            .containerRelativeFrame([.vertical, .horizontal], alignment: .center)
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                Button("Show Available In India") {
                    viewModel.showAvailable()
                }
                .buttonStyle(.bordered)
                
                Button("Sort") {
                    viewModel.sortCarsByName()
                }
                .buttonStyle(.bordered)
                
                Button("Reset", systemImage: "multiply") {
                    viewModel.reset()
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

#Preview {
    SFRBootcamp()
}


