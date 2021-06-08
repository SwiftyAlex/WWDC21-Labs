//
//  labsApp.swift
//  labs
//
//  Created by Alex Logan on 08/06/2021.
//

import SwiftUI

@main
struct labsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .accentColor(.primary)
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .environmentObject(CoffeeBoard())
        }
    }
}
