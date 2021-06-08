//
//  RefreshableCoffeeMenuViewModel.swift
//  labs
//
//  Created by Alex Logan on 08/06/2021.
//

import Foundation

class RefreshableCoffeeMenuViewModel: ObservableObject {
    @Published var coffees: [Coffee] = []

    func loadData(coffeeBoard: CoffeeBoard) {
        async {
            await refreshCoffee(coffeeBoard: coffeeBoard)
        }
    }
    
    @MainActor
    func refreshCoffee(coffeeBoard: CoffeeBoard) async {
        self.coffees = await coffeeBoard.fetchCoffees(limit: Int.random(in: 1..<Coffee.all.count))
    }
}
