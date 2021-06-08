//
//  CoffeeMenuViewModel.swift
//  labs
//
//  Created by Alex Logan on 08/06/2021.
//

import Foundation

class CoffeeMenuViewModel: ObservableObject {
    @Published var coffees: [Coffee] = []
    @Published var searchString: String = ""
    
    var searchHints: [String] {
        return coffees.map({ $0.name })
    }
    
    func loadData(coffeeBoard: CoffeeBoard) {
        self.searchString = ""
        self.coffees = Coffee.all
    }
}
