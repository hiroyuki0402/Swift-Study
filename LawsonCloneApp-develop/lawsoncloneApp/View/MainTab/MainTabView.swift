//
//  MainTabView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/26.
//

import SwiftUI

enum TabItems: Int {
    case home
    case coupon
    case mybox
    case campaign
    case topics
}

struct MainTabView: View {
    // MARK: - プロパティー
    @State var currentTab: TabItems = .home
    @State private var showUploadSheet = false

    var body: some View {
        TabView(selection: $currentTab) {
            /// ホーム
            homeTabItem

            /// 検索
            couponTabItem

            /// マイボックス
            myboxTabItem

            /// キャンペーン
            campaignTabItem

            /// トピックス
            topcsTabItem

        }//: TabView
    }//: ボディー
}

// MARK: - MainTabView アイテム

private extension MainTabView {
    // MARK: - ホーム
    private var homeTabItem: some View {
        HomeView()
            .tabItem {
                Image("home")
                Text("ホーム")

            }
            .onChange(of: currentTab) {
                currentTab = .home
            }

            .tag(TabItems.home.rawValue)
    }

    // MARK: - クーポン
    private var couponTabItem: some View {
        CouponView()
            .tabItem {
                Image("ticket")
                Text("クーポン")
            }
            .onChange(of: currentTab) {
                currentTab = .coupon
            }
            .tag(TabItems.coupon.rawValue)
    }

    // MARK: - マイボックス
    private var myboxTabItem: some View {
        MidleView()
            .tabItem {
                Image("midle" )

            }
            .onAppear {
                currentTab = .mybox
            }
            .onChange(of: currentTab) {
                currentTab = .mybox
                showUploadSheet = currentTab == .mybox
            }
            .tag(TabItems.mybox.rawValue)
    }

    // MARK: - キャンペーン
    private var campaignTabItem: some View {
        CanpaignView()
            .tabItem {
                Image(currentTab == .campaign ?  "campaignTab": "campaignTab" )
                Text("キャンペーン")
            }
            .onChange(of: currentTab) {
                currentTab = .campaign
            }
            .tag(TabItems.campaign.rawValue)
    }

    // MARK: - トピックス
    private var topcsTabItem: some View {
        TopicsView()
            .tabItem {
                Image(currentTab == .topics ?  "topics": "topics" )
                Text("トピックス")
            }
            .onChange(of: currentTab) {
                currentTab = .topics
            }
            .tag(TabItems.topics.rawValue)
    }
}

// MARK: - プレビュー

#Preview {
    MainTabView()
}
