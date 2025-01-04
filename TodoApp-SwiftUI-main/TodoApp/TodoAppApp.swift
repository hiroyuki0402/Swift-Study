//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/12.
//

import SwiftUI

@main
struct TodoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
