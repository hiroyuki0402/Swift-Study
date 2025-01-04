//
//  TopicsView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/24.
//

import Foundation
import SwiftUI

// TODO: タブの作成
// TODO: タブスクロール時に固定
// TODO: 画面遷移
// TODO: 全体的に微調整

struct TopicsView: View {
    // MARK: - プロパティー
    private var gridColumn: Double = 2.0
    private var gridLayout: [GridItem] = [GridItem(.flexible())]

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

        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }

    // MARK: - ボディー

    var body: some View {
        NavigationStack {
            List {

                /// バナー
                headerArea
                    .listRowSeparator(.hidden)

                Section(header: ZStack(alignment: .leading) {
                    /// タブ
                    genreTabArea

                }
                    .listRowInsets(EdgeInsets())
                ) {

                    /// ピックアップ
                    pickupArea.padding(.top, -10)
                    divider(height: 20)

                    /// お得情報
                    otokuArea.padding(.top, -30)
                    divider(height: 20)

                    /// キャンペーン
                    campaignArea.padding(.top, -30)
                    divider(height: 20)


                    /// 予約
                    reservationArea.padding(.top, -30)
                    divider(height: 20)


                    /// サービス
                    serviceArea.padding(.top, -30)
                    divider(height: 20)


                    /// ローソンからのお知らせ
                    noticeArea.padding(.top, -30)
                    divider(height: 20)

                    /// 募集
                    recruitmentArea.padding(.top, -30)
                }
                .listRowSeparator(.hidden)

            }//: List
            .scrollIndicators(.hidden)
            .listStyle(.plain)
            .background(.white)
            .navigationTitle(NSLocalizedString("TopicsNaigationTitle", comment: ""))
            .navigationBarTitleDisplayMode(.inline)

        }//: NavigationStack

    }//: ボディー

    private func divider(height: CGFloat, color: Color = Color(uiColor: .systemGray6)) -> some View {
        Rectangle()
            .frame(height: height)
            .foregroundColor(color)
            .padding(.top, -20)
            .padding(.bottom, -100)
            .padding(.horizontal, -20)
    }
}
// MARK: - TopicsViewアイテム

private extension TopicsView {
    /// バナー
    private var headerArea: some View {
        VStack {
            TopicksBannerItemView()
                .padding(.leading, 10)
                .padding(.top, 10)
        }
        .padding(.horizontal, -30)
    }

    /// タブ
    private var genreTabArea: some View {
        VStack(spacing: 0) {
            TopicsTabItemView()
        }
        .background(Color.white)
    }

    /// トピックスエリア
    private var pickupArea: some View {
        VStack {
            Section(header:
                        HStack(alignment: .bottom, spacing: 0) {
                Text("ピックアップ")
                    .padding(.top, 20)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }

            ) {
                LazyVGrid(columns: gridLayout, content: {
                    ForEach(TestData.shared.pickupsItems, id: \.self) { item in
                        TopicsItemView(image: item)
                            .padding(.vertical, 5)
                    }
                })
            }
        }
        .background(Color.white)
    }

    /// お得情報エリア
    private var otokuArea: some View {
        VStack {
            Section(header:
                        HStack(alignment: .bottom, spacing: 0) {
                Text("お得情報")
                    .padding(.top, 20)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            ) {
                LazyVGrid(columns: gridLayout, content: {
                    ForEach(TestData.shared.otokuItems, id: \.self) { item in
                        TopicsItemView(image: item)
                            .padding(.vertical, 5)
                    }
                })
            }
        }
        .background(Color.white)
        .padding(.top, 10)
    }

    /// キャンペーンエリア
    private var campaignArea: some View {
        VStack {
            Section(header:
                        HStack(alignment: .bottom, spacing: 0) {
                Text("キャンペーン")
                    .padding(.top, 20)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            ) {
                LazyVGrid(columns: gridLayout, content: {
                    ForEach(TestData.shared.campaignItems, id: \.self) { item in
                        TopicsItemView(image: item)
                            .padding(.vertical, 5)
                    }
                })
            }
        }
        .background(Color.white)
        .padding(.top, 10)
    }

    /// 予約エリア
    private var reservationArea: some View {
        VStack {
            Section(header:
                        HStack(alignment: .bottom, spacing: 0) {
                Text("予約")
                    .padding(.top, 20)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            ) {
                LazyVGrid(columns: gridLayout, content: {
                    ForEach(TestData.shared.reservation, id: \.self) { item in
                        TopicsItemView(image: item)
                            .padding(.vertical, 5)
                    }
                })
            }
        }
        .background(Color.white)
        .padding(.vertical, 5)
    }

    /// サービスエリア
    private var serviceArea: some View {
        VStack {
            Section(header:
                        HStack(alignment: .bottom, spacing: 0) {
                Text("サービス")
                    .padding(.top, 20)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            ) {
                LazyVGrid(columns: gridLayout, content: {
                    ForEach(TestData.shared.serviceItems, id: \.self) { item in
                        TopicsItemView(image: item)
                            .padding(.vertical, 5)
                    }
                })
            }
        }
        .background(Color.white)
        .padding(.top, 10)
    }

    /// お知らせエリア
    private var noticeArea: some View {
        VStack {
            Section(header:
                        HStack(alignment: .bottom, spacing: 0) {
                Text("ローソンからのお知らせ")
                    .padding(.top, 20)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            ) {
                LazyVGrid(columns: gridLayout, content: {
                    ForEach(TestData.shared.noticeItems, id: \.self) { item in
                        TopicsItemView(image: item)
                            .padding(.vertical, 5)
                    }
                })
            }
        }
        .background(Color.white)
        .padding(.top, 10)
    }

    /// 募集エリア
    private var recruitmentArea: some View {
        VStack {
            Section(header:
                        HStack(alignment: .bottom, spacing: 0) {
                Text("募集")
                    .padding(.top, 20)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            ) {
                LazyVGrid(columns: gridLayout, content: {
                    ForEach(TestData.shared.partTimeItems, id: \.self) { item in
                        TopicsItemView(image: item)
                            .padding(.vertical, 5)
                    }
                })
            }
        }
        .background(Color.white)
        .padding(.top, 10)
    }

}

#Preview {
    TopicsView()
}
