//
//  RefreshableCoffeeMenu.swift
//  labs
//
//  Created by Alex Logan on 08/06/2021.
//

import SwiftUI

struct RefreshableCoffeeMenu: View {
    @EnvironmentObject private var coffeeBoard: CoffeeBoard
    @StateObject var viewModel = RefreshableCoffeeMenuViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.coffees, id: \.self) { coffee in
                CoffeeMenuItemView(coffee: coffee)
                    .tag(coffee.name)
            }
        }
        .refreshable {
            await viewModel.refreshCoffee(coffeeBoard: coffeeBoard)
        }
        .onAppear {
            if viewModel.coffees.isEmpty {
                viewModel.loadData(coffeeBoard: coffeeBoard)
            }
        }
        .navigationTitle("Menu")
        .listStyle(.insetGrouped)
    }
}

struct RefreshableCoffeeMenu_Previews: PreviewProvider {
    static var previews: some View {
        RefreshableCoffeeMenu()
    }
}
