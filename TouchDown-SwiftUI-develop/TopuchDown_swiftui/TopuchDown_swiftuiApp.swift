//
//  TopuchDown_swiftuiApp.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/29.
//

import SwiftUI

@main
struct TopuchDown_swiftuiApp: App {

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(Shop())
        }
    }
}
