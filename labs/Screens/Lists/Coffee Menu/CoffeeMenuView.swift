//
//  CoffeeMenuView.swift
//  labs
//
//  Created by Alex Logan on 08/06/2021.
//

import SwiftUI

struct CoffeeMenuView: View {
    
    @EnvironmentObject private var coffeeBoard: CoffeeBoard
    @StateObject var viewModel = CoffeeMenuViewModel()
    
    var listedCoffees: [Coffee] {
        viewModel.coffees
            .filter { $0.name.hasPrefix(viewModel.searchString) }
    }
    
    var body: some View {
        List {
            Section {
                ForEach(listedCoffees, id: \.self) { coffee in
                    CoffeeMenuItemView(coffee: coffee)
                        .tag(coffee.name)
                }
            }
        }
        .searchable(text: $viewModel.searchString, placement: .navigationBarDrawer(displayMode: .always)) {
            ForEach(viewModel.searchHints.filter { $0.hasPrefix(viewModel.searchString) } , id: \.self) { suggestion in
                Text(suggestion).searchCompletion(suggestion)
            }
        }
        .task {
            if viewModel.coffees.isEmpty {
                viewModel.loadData(coffeeBoard: coffeeBoard)
            }
        }
        .navigationTitle("Menu")
        .listStyle(.insetGrouped)
    }
}

struct CoffeeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeMenuView()
            .environmentObject(CoffeeBoard())
    }
}
