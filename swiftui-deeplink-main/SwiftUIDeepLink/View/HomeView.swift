//
//  HomeView.swift
//  SwiftUIDeepLink
//
//  Created by SHIRAISHI HIROYUKI on 2024/09/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var appViewModel: AppDataViewModel

    var body: some View {
        TabView(selection: $appViewModel.selectedTab) {
            HomeViewContents()
                .tag(MainTab.home)
                .tabItem {
                    Image(systemName: MainTab.home.symbolName)
                }

            FavoriteViewContents()
                .tag(MainTab.favorite)
                .tabItem {
                    Image(systemName: MainTab.favorite.symbolName)
                }

            settingViewContents()
                .tag(MainTab.settings)
                .tabItem {
                    Image(systemName: MainTab.settings.symbolName)
                }
        }
        .tint(.red)
    }
}

private extension HomeView {
    @ViewBuilder
    func HomeViewContents() -> some View {
        NavigationStack(path: $appViewModel.homeNavStack) {
            List {
                ForEach(HomeNavStack.allCases, id: \.self) { content in
                    NavigationLink(value: content) {
                        Text(content.rawValue)
                    }
                }

            }
            .navigationTitle(.constant(.title(.homeNavTitle)))
            .navigationDestination(for: HomeNavStack.self) { link in
                Text("画面遷移: { \(link.rawValue) }")
            }
        }
    }

    @ViewBuilder
    func FavoriteViewContents() -> some View {
        NavigationStack(path: $appViewModel.favoriteNavStack) {
            List {
                ForEach(FavoriteNavStack.allCases, id: \.self) { content in
                    NavigationLink(value: content) {
                        Text(content.rawValue)
                    }
                }

            }
            .navigationTitle(.constant(.title(.favoriteNavTitle)))
            .navigationDestination(for: FavoriteNavStack.self) { link in
                Text("画面遷移: { \(link.rawValue) }")
            }
        }
    }

    @ViewBuilder
    func settingViewContents() -> some View {
        NavigationStack(path: $appViewModel.settingNavStack) {
            List {
                ForEach(SettingNavStack.allCases, id: \.self) { content in
                    NavigationLink(value: content) {
                        Text(content.rawValue)
                    }
                }

            }
            .navigationTitle(.constant(.title(.settingNavTitle)))
            .navigationDestination(for: SettingNavStack.self) { link in
                Text("画面遷移: { \(link.rawValue) }")
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppDataViewModel())
}
