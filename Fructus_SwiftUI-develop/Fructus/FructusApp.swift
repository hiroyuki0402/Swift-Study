//
//  FructusApp.swift
//  Fructus
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/16.
//

import SwiftUI

@main
struct FructusApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    

    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}
