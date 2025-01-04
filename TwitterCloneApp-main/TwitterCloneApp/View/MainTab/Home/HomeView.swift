//
//  HomeView.swift
//  TwitterCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2024/06/02.
//

import SwiftUI
import MyLibrary

struct HomeView: View {
    // MARK: - プロパティー
    /// Viewモデル
    @StateObject private var homeViewModel = HomeViewModel()
    
    /// ヘッダーのタブ
    @State private var selectedTab: HeaderTabViewTabItem = .recommend
    
    // MARK: - ボディー
    var body: some View {
        ScrollView(.vertical) {
            /// ヘッダーエリア
            headerTabArea()
            
            if selectedTab == .follow {
                FollowView(whoToFollowData: homeViewModel.whoToFollowData, sectionTitle: "Who to follow")
            } else if selectedTab == .recommend {
                RecommendView(followDatas: homeViewModel.followDatas)
                FollowView(whoToFollowData: homeViewModel.whoToFollowData, sectionTitle: "Who to follow")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
            feddButton(),
            alignment: .bottomTrailing
        )
    }
}

// MARK: - コンポーネント
private extension HomeView {
    
    /// 投稿
    private func feddButton() -> some View {
        Button {
            
        } label: {
            Image(systemName: "plus")
                .renderingMode(.template)
                .resizable()
                .foregroundStyle(.black)
                .padding(12)
                .frame(width: 40, height: 40)
                .background(Color.background)
                .clipShape(Circle())
                .padding(.horizontal, 10)
                .padding(.bottom, 50)
        }
    }
    
    /// ヘッダーエリア表示用のView
    private func headerTabArea() -> some View {
        VStack {
            headerBarItem()
            hederTab()
            Divider()
        }
    }
    
    /// ヘッダーメニュー
    private func topBarLeading() -> some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(10)
                    .background(.black)
                    .clipShape(Circle())

            }
        }
    }

    /// ヘッダーアイコン
    private func topBarPrincipal() -> some View {
        Image(.tweetX)
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    /// ヘッダー右側
    /// - note: ヘッダーの要素を均等にするためにダミー
    private func topBarTrailing() -> some View {
        Text(" ")
            .frame(width: 20)
            .padding(10)
    }
    
    /// ヘッダーのエリアのタブのタイテム
    private func hederTab() -> some View {
        HStack {
            HeaderTabView(selectedTab: $selectedTab)
        }
    }
    
    /// ヘッダーのエリアのタブのタイテム
    private func headerBarItem() -> some View {
        HStack {
            topBarLeading()
            
            Spacer()
            
            topBarPrincipal()
            
            Spacer()
            
            topBarTrailing()
        }
        .padding(.horizontal)
    }
    
}

#Preview {
    HomeView()
}
