//
//  Fundy_2_0App.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 27/2/2023.
//

import SwiftUI

@main
struct Fundy_2_0App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
