//
//  FancyCoffeeMenu.swift
//  labs
//
//  Created by Alex Logan on 08/06/2021.
//

import SwiftUI

struct FancyCoffeeMenu: View {
    @StateObject var viewModel = FancyCoffeeMenuViewModel()
    @EnvironmentObject private var coffeeBoard: CoffeeBoard
    
    let menuGridItems: [GridItem] = [
        GridItem(.adaptive(minimum: 150)),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: menuGridItems, alignment: .center, spacing: 20) {
                ForEach(viewModel.coffees, id: \.self) { coffee in
                    FancyCoffeeMenuItemView(coffee: coffee)
                        .aspectRatio(1.0, contentMode: .fill)
                        .tag(coffee.name)
                }
            }
            .padding()
        }
        .onAppear {
            if viewModel.coffees.isEmpty {
                viewModel.loadData(coffeeBoard: coffeeBoard)
            }
        }
        .navigationTitle("Fancy Menu")
        .background(Color(uiColor: .systemGroupedBackground))
    }
}

struct FancyCoffeeMenu_Previews: PreviewProvider {
    static var previews: some View {
        FancyCoffeeMenu()
    }
}
