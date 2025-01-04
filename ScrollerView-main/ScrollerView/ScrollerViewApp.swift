//
//  ScrollerViewApp.swift
//  ScrollerView
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/04.
//

import SwiftUI

@main
struct ScrollerViewApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
