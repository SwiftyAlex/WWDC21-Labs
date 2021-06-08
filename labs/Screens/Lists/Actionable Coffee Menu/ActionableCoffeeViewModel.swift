//
//  ActionableCoffeeViewModel.swift
//  labs
//
//  Created by Alex Logan on 08/06/2021.
//

import Foundation
import SwiftUI

class ActionableCoffeeViewModel: ObservableObject {
    @Published var coffees: [Coffee] = []
    @Published var pinnedCoffees: [Coffee] = []

    func loadData(coffeeBoard: CoffeeBoard) {
        self.coffees = Coffee.all
        self.pinnedCoffees = []
    }
    
    func togglePinnedCoffee(_ coffee: Coffee) {
        withAnimation {
            if let existingIndex = pinnedCoffees.firstIndex(of: coffee) {
                pinnedCoffees.remove(at: existingIndex)
            } else {
                pinnedCoffees.append(coffee)
            }
        }
    }
}
