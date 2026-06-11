//
//  charactersApp.swift
//  characters
//
//  Created by Paul Montealegre on 10/06/26.
//

import SwiftUI
import CoreData

@main
struct charactersApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
