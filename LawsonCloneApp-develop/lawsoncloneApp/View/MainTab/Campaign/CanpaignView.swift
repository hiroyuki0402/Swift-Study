//
//  CanpaignView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/24.
//

import Foundation
import SwiftUI

// TODO: 画面遷移
// TODO: 全体的に微調整

struct CanpaignView: View {
    // MARK: - プロパティー

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
            VStack {
                ScrollView {
                    VStack(spacing: 0) {
                        /// プッシュ許諾バナー
                        permissionBannerArea

                        /// キャンペーン
                        campaignArea

                        /// アプリ限定
                        appLimitedArea
                    }//: VStack
                }//: ScrollView
            }//: VStack
            .scrollIndicators(.hidden)
            .listStyle(.plain)
            .background(Color(.systemGray6))
            .toolbar {
                /// 設定
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .font(.callout)
                        .padding(2)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                }
            }
            .navigationTitle(NSLocalizedString("CampaignNaigationTitle", comment: ""))
            .navigationBarTitleDisplayMode(.inline)

        }//: NavigationStack

    }//: ボディー
}

// MARK: - CanpaignViewアイテム

private extension CanpaignView {
    /// 許諾バナー
    private var permissionBannerArea: some View {
        PermissionBannerView()
            .padding(.bottom, 20)
    }

    /// キャンペーンエリア
    private var campaignArea: some View {
        Section(
            header: HStack {
                Text("キャンペーン")
                    .font(.footnote)
                    .padding(5)
                    .padding(.leading, 10)
                Spacer()
            },
            footer: HStack {
                Button {

                } label: {
                    HStack {
                        Text("すべて見る")
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.white)


                }
            }
        ) {
            ForEach(TestData.shared.campaignItems.prefix(3), id: \.self) { item in
                CampaignListRowItem(image: item)
                Divider()
            }

        }
    }
    /// アプリ限定エリア
    private var appLimitedArea: some View {
        Section(
            header: HStack {
                Text("アプリ限定ボーナスポイント")
                    .font(.footnote)
                    .padding(5)
                    .padding(.leading, 10)
                Spacer()
            }.padding(.top, 30),

            footer: HStack {
                Button {

                } label: {
                    HStack {
                        Text("すべて見る")
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.white)
                }
            }
        ) {
            ForEach(TestData.shared.reservation.prefix(3), id: \.self) { item in
                CampaignListRowItem(image: item)
                Divider()

            }

        }
    }
}

#Preview {
    CanpaignView()
}
