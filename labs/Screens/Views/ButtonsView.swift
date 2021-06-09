//
//  ButtonsView.swift
//  labs
//
//  Created by Alex Logan on 09/06/2021.
//

import SwiftUI

struct ButtonsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("Regular Prominence")
                    .font(.headline)
                makeButtonSection(title: "Small", controlSize: .small, prominence: .standard)
                makeButtonSection(title: "Regular", controlSize: .regular, prominence: .standard)
                makeButtonSection(title: "Large", controlSize: .large, prominence: .standard)
                Text("Increased Prominence")
                    .font(.headline)
                makeButtonSection(title: "Small", controlSize: .small, prominence: .increased)
                makeButtonSection(title: "Regular", controlSize: .regular, prominence: .increased)
                makeButtonSection(title: "Large", controlSize: .large, prominence: .increased)
            }
            .frame(maxWidth: .infinity)
        }
        .background(Color(uiColor: .systemGroupedBackground))
        .navigationTitle("Buttons")
    }
        
    func makeButtonSection(title: String, controlSize: ControlSize, prominence: Prominence) -> some View {
        VStack(alignment: .center, spacing: 12) {
            Button("Bordered") { }
                .buttonStyle(.bordered)
            Button("Automatic") { }
                .buttonStyle(.automatic)
            Button("Plain") { }
                .buttonStyle(.plain)
            Button("Borderless") { }
                .buttonStyle(.plain)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            Color(uiColor: .systemBackground), in: RoundedRectangle(cornerRadius: 12, style: .continuous)
        )
        .padding()
        .tint(.blue)
        .controlProminence(prominence)
        .controlSize(controlSize)
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
