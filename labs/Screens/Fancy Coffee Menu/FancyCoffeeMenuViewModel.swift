//
//  FancyCoffeeMenuViewModel.swift
//  labs
//
//  Created by Alex Logan on 08/06/2021.
//

import Foundation

class FancyCoffeeMenuViewModel: ObservableObject {
    @Published var coffees: [Coffee] = []
 
    func loadData(coffeeBoard: CoffeeBoard) {
        self.coffees = Coffee.all
    }
}
