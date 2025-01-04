//
//  AppDataViewModel.swift
//  SwiftUIDeepLink
//
//  Created by SHIRAISHI HIROYUKI on 2024/09/25.
//

import SwiftUI

class AppDataViewModel: ObservableObject {
    @Published var selectedTab: MainTab = .home
    @Published var homeNavStack: [HomeNavStack] = []
    @Published var favoriteNavStack: [FavoriteNavStack] = []
    @Published var settingNavStack: [SettingNavStack] = []
}

