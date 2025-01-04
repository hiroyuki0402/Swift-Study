//
//  PinchApp_SwiftUIApp.swift
//  PinchApp_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/15.
//

import SwiftUI

@main
struct PinchApp_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
