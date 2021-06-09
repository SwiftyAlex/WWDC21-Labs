//
//  FancyCoffeeMenuItemView.swift
//  labs
//
//  Created by Alex Logan on 08/06/2021.
//

import SwiftUI

struct FancyCoffeeMenuItemView: View {
    let coffee: Coffee
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: coffee.imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fill)
            } placeholder: {
                Color(uiColor: .lightGray)
                    .aspectRatio(1.0, contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .accessibility(hidden: true)
            }

            VStack {
                Text(coffee.name)
                    .foregroundStyle(.primary)
                    .font(.headline)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

struct FancyCoffeeMenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        FancyCoffeeMenuItemView(coffee: .cortado)
    }
}
