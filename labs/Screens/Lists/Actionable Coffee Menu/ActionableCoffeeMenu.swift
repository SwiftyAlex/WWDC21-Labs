//
//  ActionableCoffeeMenu.swift
//  labs
//
//  Created by Alex Logan on 08/06/2021.
//

import SwiftUI

struct ActionableCoffeeMenu: View {
    @EnvironmentObject private var coffeeBoard: CoffeeBoard
    @StateObject var viewModel = ActionableCoffeeViewModel()

    var body: some View {
        List {
            if viewModel.pinnedCoffees.count > 0 {
                Section("Your Coffees") {
                    ForEach(viewModel.pinnedCoffees, id: \.self) { coffee in
                        CoffeeMenuItemView(coffee: coffee)
                            .tag(coffee.name)
                            .swipeActions {
                                Button(action: { viewModel.togglePinnedCoffee(coffee) }, label: {
                                    Image(systemName: "pin.slash.fill")
                                })
                                    .tint(.orange)
                            }
                    }
                }
            }
            Section("All Coffees") {
                ForEach(viewModel.coffees, id: \.self) { coffee in
                    CoffeeMenuItemView(coffee: coffee)
                        .tag(coffee.name)
                        .swipeActions {
                            Button(action: { viewModel.togglePinnedCoffee(coffee) }, label: {
                                Image(systemName: "pin.fill")
                            })
                            .tint(.yellow)
                        }
                }
            }
        }
        .onAppear {
            if viewModel.coffees.isEmpty {
                viewModel.loadData(coffeeBoard: coffeeBoard)
            }
        }
        .navigationTitle("Your Coffee")
        .listStyle(.insetGrouped)
    }
}

struct ActionableCoffeeMenu_Previews: PreviewProvider {
    static var previews: some View {
        ActionableCoffeeMenu()
    }
}
