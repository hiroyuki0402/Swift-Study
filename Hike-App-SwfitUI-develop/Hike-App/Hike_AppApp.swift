//
//  Hike_AppApp.swift
//  Hike-App
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/09.
//

import SwiftUI

@main
struct Hike_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CardView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
