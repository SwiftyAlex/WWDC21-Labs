//
//  CoffeeMenuItemView.swift
//  labs
//
//  Created by Alex Logan on 08/06/2021.
//

import SwiftUI

struct CoffeeMenuItemView: View {
    let coffee: Coffee
    
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: coffee.imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .accessibility(hidden: true)
            } placeholder: {
                Color.gray
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .accessibility(hidden: true)
            }

            VStack(alignment: .leading) {
                Text(coffee.name)
                    .font(.headline)
            }
        }
    }
}

struct CoffeeMenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeMenuItemView(coffee: .mocha)
    }
}
