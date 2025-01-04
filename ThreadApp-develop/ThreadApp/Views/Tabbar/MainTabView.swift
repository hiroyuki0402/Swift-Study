//
//  TabView.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/17.
//

import SwiftUI

enum TabItems: Int {
    case home
    case search
    case upload
    case activity
    case profile
}

struct MainTabView: View {
    // MARK: - プロパティー
    @State var currentTab: TabItems = .home
    @State private var showUploadSheet = false

    // MARK: - ボディー
    var body: some View {
        TabView(selection: $currentTab) {
            /// ホーム
            homeTabItem

            /// 検索
            searchTabItem

            /// アップロード
            uploadTabItem

            /// アクティビティー
            activityTabItem

            /// プロフィール
            profileTabItem
        }//: TabView
        .sheet(isPresented: $showUploadSheet) {
            UploadView()
        }
        .tint(Color.black)

    }//: ボディー
}
// MARK: - MainTabView アイテム

private extension MainTabView {
    // MARK: - ホーム
    private var homeTabItem: some View {
        HomeView()
            .tabItem {
                Image(systemName: currentTab == .home ?  "house.fill": "house" )
                    .environment(\.symbolVariants, currentTab == .home ? .fill: .none)
            }
            .onChange(of: currentTab) {
                currentTab = .home
            }

            .tag(TabItems.home.rawValue)
    }

    // MARK: - 検索
    private var searchTabItem: some View {
        SearchView()
            .tabItem {
                Image(systemName: "magnifyingglass")
            }
            .onChange(of: currentTab) {
                currentTab = .search
            }
            .tag(TabItems.search.rawValue)
    }

    // MARK: - アップロード
    private var uploadTabItem: some View {
        Rectangle()
            .tabItem {
                Image(systemName:"plus" )
            }
            .onAppear {
                currentTab = .upload
            }
            .onChange(of: currentTab) {
                currentTab = .upload
                showUploadSheet = currentTab == .upload
            }
            .tag(TabItems.upload.rawValue)
    }

    // MARK: - 行動
    private var activityTabItem: some View {
        ActivityView()
            .tabItem {
                Image(systemName: currentTab == .activity ?  "suit.heart.fill": "heart" )
                    .environment(\.symbolVariants, currentTab == .activity ? .fill: .none)
            }
            .onChange(of: currentTab) {
                currentTab = .activity
            }
            .tag(TabItems.activity.rawValue)
    }

    // MARK: - プロフィール
    private var profileTabItem: some View {
        CurrentUserPrifileView()
            .tabItem {
                Image(systemName: currentTab == .profile ?  "person.fill": "person" )
                    .environment(\.symbolVariants, currentTab == .profile ? .fill: .none)
            }
            .onChange(of: currentTab) {
                currentTab = .profile
            }
            .tag(TabItems.profile.rawValue)
    }
}

#Preview {
    MainTabView()
}
