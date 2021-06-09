//
//  MaterialView.swift
//  labs
//
//  Created by Alex Logan on 09/06/2021.
//

import SwiftUI

struct MaterialView: View {
    
    let gridItems: [GridItem] = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGroupedBackground).edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    Text("Every material applied over Taylor Swift's Lover album art.")
                        .lineLimit(2)
                        .foregroundStyle(.primary)
                    LazyVGrid(columns: gridItems, alignment: .center, spacing: 20) {
                        MaterialItemView(material: .ultraThin, identifier: "Ultra Thin")
                        MaterialItemView(material: .thin, identifier: "Thin")
                        MaterialItemView(material: .regular, identifier: "Regular")
                        MaterialItemView(material: .thick, identifier: "Thick")
                        MaterialItemView(material: .ultraThick, identifier: "Ultra Thick")
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Material")
    }
}

struct MaterialItemView: View {
    let material: Material
    let identifier: String
    
    var body: some View {
        VStack(spacing: 12) {
            contentView
            Text(identifier)
                .font(.caption)
        }
    }
    
    var contentView: some View {
        ZStack {
            Image("lover")
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
            
            VStack {
                Spacer()
                Text("Lover")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("Lover")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                Text("Lover")
                    .font(.headline)
                    .foregroundStyle(.tertiary)
                Text("Lover")
                    .font(.headline)
                    .foregroundStyle(.quaternary)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(material)
        }
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .shadow(color: Color(uiColor: .lightGray), radius: 12)
    }
}

struct MaterialView_Previews: PreviewProvider {
    static var previews: some View {
        MaterialView()
    }
}
