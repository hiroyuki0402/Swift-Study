//
//  SwiftUIDeepLinkApp.swift
//  SwiftUIDeepLink
//
//  Created by SHIRAISHI HIROYUKI on 2024/09/25.
//

import SwiftUI

@main
struct SwiftUIDeepLinkApp: App {
    @StateObject var appDataViewModel: AppDataViewModel = AppDataViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appDataViewModel)
                .onOpenURL { url in
                    /// Deeplinkがトリガーされたら呼ばれる
                    let urlString = url.absoluteString.replacingOccurrences(of: "deeplinkapp://", with: "")

                    let components = urlString.components(separatedBy: "?")

                    for component in components {
                        if component.contains("tab=") {
                            let tabRawVal = component.replacingOccurrences(of: "tab=", with: "")
                            if let reqestTab = MainTab.convert(tabRawVal) {
                                appDataViewModel.selectedTab = reqestTab
                            }
                        }

                        if component.contains("nav="), urlString.contains("tab") {
                            let reqNavPath = component
                                .replacingOccurrences(of: "nav=", with: "")
                                .replacingOccurrences(of: "_", with: "")
                            destination(reqest: reqNavPath)
                        }
                    }
                }
        }
    }
}

private extension SwiftUIDeepLinkApp {
    private func destination(reqest: String) {
        switch appDataViewModel.selectedTab {
        case .home:
            if let homePath = HomeNavStack.convert(reqest) {
                appDataViewModel.homeNavStack.append(homePath)
            }
        case .favorite:
            if let favoritePath = FavoriteNavStack.convert(reqest) {
                appDataViewModel.favoriteNavStack.append(favoritePath)
            }
        case .settings:
            if let settingsPath = SettingNavStack.convert(reqest) {
                appDataViewModel.settingNavStack.append(settingsPath)
            }
        }
    }
}
