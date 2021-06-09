//
//  TimelineViewView.swift
//  labs
//
//  Created by Alex Logan on 09/06/2021.
//

import SwiftUI

struct TimelineViewView: View {
    
    let albumNames: [String] = ["1989", "reputation", "lover", "folklore", "evermore", "fearless (taylors version)"]
    let startDate = Date()
        
    var body: some View {
        TimelineView(.periodic(from: startDate, by: 1)) { timelineContext in
            let imageName = makeAlbum()
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .overlay(.thinMaterial)
                .overlay(
                    VStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fit)
                        .frame(maxWidth: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .circular))
                    Text(imageName.uppercased(with: .autoupdatingCurrent))
                        .foregroundStyle(.secondary)
                        .font(.headline)
                    }
                )
        }
        .navigationBarTitle(Text("Albums"), displayMode: .inline)
    }
    
    func makeAlbum() -> String {
        return albumNames.shuffled().prefix(1).first ?? "folklore"
    }
}

struct TimelineViewView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineViewView()
    }
}
