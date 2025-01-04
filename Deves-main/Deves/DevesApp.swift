//
//  DevesApp.swift
//  Deves
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/05.
//

import SwiftUI

@main
struct DevesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
