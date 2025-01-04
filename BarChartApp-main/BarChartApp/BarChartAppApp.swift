//
//  BarChartAppApp.swift
//  BarChartApp
//
//  Created by SHIRAISHI HIROYUKI on 2024/01/17.
//

import SwiftUI

@main
struct BarChartAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
