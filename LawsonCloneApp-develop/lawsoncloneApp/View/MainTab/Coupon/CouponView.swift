//
//  CouponView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/24.
//

import Foundation
import SwiftUI

struct CouponView: View {
    // MARK: - プロパティー

    /// 選択したジャンル
    @State private var selectedGenre: GenreItem = .all

    @State private var selectedTab: TabItem = .now

    @State private var bannerHide: Bool = false

    /// Viewモデル
    @StateObject var couponViewModel = CouponViewModel()

    // MARK: - 初期化

    init(){
        let appearance = UINavigationBarAppearance()
        /// ナビゲーションバーの背景色
        appearance.backgroundColor = .navigationBar

        /// タイトルの文字色
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]

        /// 設定
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        UIScrollView.appearance().showsVerticalScrollIndicator = false
    }

    // MARK: - ボディー

    var body: some View {
        NavigationStack {
            List {

                switch selectedTab {
                case .now:
                    permissionBannerView
                    couponShowArea

                case .trial:
                    permissionBannerView
                    trialView
                }

            }//: List
            .scrollIndicators(.hidden)
            .listStyle(.plain)
            .background(Color(.systemGray6))
            .toolbar {
                /// 設定
                ToolbarItem(placement: .topBarTrailing) {
                    infomationBarbuttonItem
                }
            }
            .navigationTitle(NSLocalizedString("CouponNaigationTitle", comment: ""))
            .navigationBarTitleDisplayMode(.inline)

        }//: NavigationStack
    }//: ボディ
}

// MARK: - CouponViewアイテム

private extension CouponView {

    /// プッシュ通知許諾バナー
    private var permissionBannerView: some View {
        PermissionBannerView(isHide: bannerHide, complision: {
            bannerHide = true
        })
            .listRowSeparator(.hidden)
    }

    /// クーポン表示エリア
    private var couponShowArea: some View {
        Section(header: ZStack(alignment: .leading) {
            Color.clear.frame(maxWidth: .infinity)
            HeaderView(selectedGenre: $selectedGenre, selectedTab: $selectedTab)

        }
            .listRowInsets(EdgeInsets())
        ) {

            /// クーポンのセル
            ForEach(couponViewModel.filteredItems(for: selectedGenre)) { item in
                /// クーポン
                CouponItemView(coupondata: item)
                    /// アイテム間のスペース
                    .padding(.vertical, 10)
                    .padding(.horizontal, 10)

                    /// デフォルトのインセットを取り除く
                    .listRowInsets(EdgeInsets())

                    /// リスト行の背景を透明に設定
                    .listRowBackground(Color.clear)
            }
        }
        .listRowSeparator(.hidden)
    }

    /// ヘルプ
    private var infomationBarbuttonItem: some View {
        Image(systemName: "info.circle")
            .resizable()
            .font(.callout)
            .padding(2)
            .frame(width: 24, height: 24)
            .foregroundColor(.white)
    }

    private var trialView: some View {

        Section(header: ZStack(alignment: .leading) {
            Color.clear.frame(maxWidth: .infinity)
            HeaderView(selectedGenre: $selectedGenre, selectedTab: $selectedTab)

        }
            .listRowInsets(EdgeInsets())
        ) {

            /// クーポンのセル(引換券)
            ForEach(couponViewModel.coupondatas) { item in
                /// クーポン
                TrialView(coupondata: item)
                /// アイテム間のスペース
                    .padding(.vertical, 3)

                /// デフォルトのインセットを取り除く
                    .listRowInsets(EdgeInsets())

                /// リスト行の背景を透明に設定
                    .listRowBackground(Color.clear)
            }
            .listRowSeparator(.hidden)
        }
    }
}

#Preview {
    CouponView()
}

