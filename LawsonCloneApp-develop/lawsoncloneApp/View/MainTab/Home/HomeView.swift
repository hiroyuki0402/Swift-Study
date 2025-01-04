//
//  HomeView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    // MARK: - プロパティー

    /// 背景色
    private let backGroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    // MARK: - 初期化

    init(){
        let appearance = UINavigationBarAppearance()
        /// ナビゲーションバーの背景色
        appearance.backgroundColor = .navigationBar

        appearance.shadowColor = .clear

        /// タイトルの文字色
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.shadowImage = UIImage()


        /// 設定
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .black

        /// スクロールビュー
        UIScrollView.appearance().bounces = false
    }

    // MARK: - ボディー

    var body: some View {

        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    /// Topバナー
                    HomeTopBannerView()
                        .padding(.bottom, 20)

                    /// キャンペーンバナー
                    BannerView()
                        .padding(.leading)

                    /// ログインに関して
                    LowsonAppdescription()
                        .padding()

                    ///  予約
                    ReservationView(reservationHeaderItem: .christmas)
                        .padding(.leading)
                        .padding(.top)
                        .padding(.bottom, 20)
                    
                    /// クーポン
                    CoiponView(itemType: .coupon)
                        .padding(.leading)
                        .padding(.top)
                        .padding(.bottom, 20)

                    /// クーポン
                    CoiponView(itemType: .exchange)
                        .padding(.leading)
                        .padding(.top)
                        .padding(.bottom, 20)

                    /// キャンペーン
                    HomeCampaingnView()
                        .padding(.leading)
                        .padding(.top)
                        .padding(.bottom, 20)

                    /// 新商品
                    NewItemView()
                        .padding(.leading)
                        .padding(.top)
                        .padding(.bottom, 20)
                    /// その他
                    OthersView()
                        .padding(.top)

                    Spacer()
                }
                .toolbar {

                    /// お知らせ
                    ToolbarItem(placement: .topBarLeading) {
                        Image(systemName: "bell")
                            .resizable()
                            .font(.callout)
                            .padding(4)
                            .frame(width: 24, height: 24)
                            .background(.white)
                            .clipShape(
                                Circle()
                            )
                            .foregroundColor(.blue)
                    }

                    /// 設定
                    ToolbarItem(placement: .topBarTrailing) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .font(.callout)
                            .padding(2)
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    }
                }
                .navigationTitle(NSLocalizedString("NaigationTitle", comment: ""))
                .navigationBarTitleDisplayMode(.inline)
            }//: ScrollView
            .padding(.top, 97)
            .ignoresSafeArea()
            .background(Color(backGroundColor))
            .overlay (
                Button {

                } label: {
                    VStack {
                       Image(systemName: "iphone.sizes")
                            .font(.title2)
                        Text("スマホレジ")
                            .font(.footnote)
                    }
                    .padding()
                }
                .frame(width: 100, height: 60)
                .background(Color.white)
                .modifier(CornerRadiusStyle(radius: 30, corners: [.bottomLeft, .topLeft]))
                .padding(.bottom, 40)
                .shadow(radius: 10)
                ,alignment: .bottomTrailing


            )

        }//: NavigationStack

    }//: ボディー
}

// MARK: - プレビュー

#Preview {
    HomeView()
}
