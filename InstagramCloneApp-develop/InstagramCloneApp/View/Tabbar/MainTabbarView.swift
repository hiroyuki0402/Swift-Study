//
//  MainTabbarView.swift
//  InstagramCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/09.
//

import SwiftUI

struct MainTabbarView: View {
    var body: some View {
        TabView {
            /// ホーム
            feddItem

            /// サーチ
            serarchItem

            /// アップロード
            uploadItem

            /// 通知
            notificationItem

            /// プロフィール
            profileItem
        }
        .tint(.black)
    }
}

// MARK: - MainTabbarViewアイテム
private extension MainTabbarView  {

    /// ホーム
    private var feddItem: some View {
        Text("Feed")
            .tabItem {
                Image(systemName: "house")
            }
    }

    /// サーチ
    private var serarchItem: some View {
        Text("Search")
            .tabItem {
                Image(systemName: "magnifyingglass")
            }
    }

    /// アップロード
    private var uploadItem: some View {
        Text("Upload")
            .tabItem {
                Image(systemName: "plus.square")
            }
    }

    /// 通知
    private var notificationItem: some View {
        Text("Notifications")
            .tabItem {
                Image(systemName: "heart")
            }
    }

    /// プロフィール
    private var profileItem: some View {
        Text("Profile")
            .tabItem {
                Image(systemName: "person")
            }
    }

}

// MARK: - Preview

#Preview {
    MainTabbarView()
}
