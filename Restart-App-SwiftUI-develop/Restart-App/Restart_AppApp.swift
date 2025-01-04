//
//  Restart_AppApp.swift
//  Restart-App
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/10.
//

import SwiftUI

@main
struct Restart_AppApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage("onboarding") var isOnboardingViewActivite: Bool = false

    var body: some Scene {
        WindowGroup {
            if isOnboardingViewActivite {
                OnboardingView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            } else {
                HomeView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
