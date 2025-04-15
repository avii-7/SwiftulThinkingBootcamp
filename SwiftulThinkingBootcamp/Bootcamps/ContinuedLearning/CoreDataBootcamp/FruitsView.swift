//
//  FruitsView.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun's Macbook on 10/04/25.
//

import SwiftUI
import CoreData

struct FruitsView: View {
    
    @StateObject private var vm = FruitsViewModel()
    
    @State private var fruitName = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    TextField("Enter fruit name", text: $fruitName)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Add") {
                        vm.addFruit(name: fruitName)
                        fruitName = ""
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(fruitName.isEmpty)
                }
                .padding(.horizontal)
                
                List {
                    ForEach(vm.fruits) { fruit in
                        Text(fruit.name)
                    }
                    .onDelete(perform: vm.deleteFruits)
                }
                .navigationTitle("Fruits")
            }
            .onAppear {
                vm.fetchAllFruits()
            }
        }
    }
}

#Preview {
    FruitsView()
}

final class FruitsViewModel: ObservableObject {
    
    @Published var fruits = [Fruit]()
    
    private let persistence = FruitsPersistence()
    
    func fetchAllFruits() {
        fruits = persistence.getAllFruits()
    }
    
    func addFruit(name: String) {
        let fruit = Fruit(name: name)
        persistence.addFruit(fruit: fruit)
        fruits.append(fruit)
    }
    
    func deleteFruits(at indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let fruit = fruits.remove(at: index)
        persistence.delete(fruit: fruit)
    }
}


final class FruitsPersistence {
    
    private let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "FruitsContainer")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                print("Error while creating persistent container: \(error)")
            }
        }
    }
    
    func getAllFruits() -> [Fruit] {
        
        let fruitRequest = FruitEntity.fetchRequest()
        do {
            let result = try persistentContainer.viewContext.fetch(fruitRequest)
            return result.map { Fruit(id: $0.id ?? UUID() ,name: $0.name ?? "Unknown") }
        }
        catch {
            print("Eror while fetching fruits: \(error)")
            return []
        }
    }
    
    func addFruit(fruit: Fruit) {
        let entity = FruitEntity(context: persistentContainer.viewContext)
        entity.id = fruit.id
        entity.name = fruit.name
        save()
    }
    
    private func getFruit(with id: UUID) -> FruitEntity? {
        let fruitRequest = FruitEntity.fetchRequest()
        fruitRequest.fetchLimit = 1
        fruitRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        do {
            let result = try persistentContainer.viewContext.fetch(fruitRequest)
            return result.first
        }
        catch {
            print("Eror while fetching fruit: \(error)")
            return nil
        }
    }
    
    func delete(fruit: Fruit) {
        guard let fruitEntity = getFruit(with: fruit.id) else {
            print("Not able to find fruit \(fruit)")
            return
        }
        persistentContainer.viewContext.delete(fruitEntity)
        save()
    }
    
    private func save() {
        do {
            if persistentContainer.viewContext.hasChanges {
                try persistentContainer.viewContext.save()
            }
        }
        catch {
            print("Error while saving: \(error)")
        }
    }
}
