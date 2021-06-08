//
//  CoffeeBoard.swift
//  labs
//
//  Created by Alex Logan on 08/06/2021.
//

import Foundation
import Combine

class CoffeeBoard: ObservableObject {
    @Published var coffees: [Coffee] = [
        .cortado, .flatWhite, .mocha, .latte, .icedLatte, .hotChocolate
    ]
    
    func fetchCoffees(limit: Int) async -> [Coffee] {
        return Array(Coffee.all.shuffled().prefix(limit))
    }
}
