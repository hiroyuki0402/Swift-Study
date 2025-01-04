//
//  BannerView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/25.
//

import SwiftUI

/*
 TODO: - 決済連携
 */

struct HomeTopBannerView: View {
    // MARK: - プロパティー

    // MARK: - ボディー
    var body: some View {
        VStack {
            ZStack {
                /// 扇形の背景
                backkGroundItem

                /// バナー
                bannerItem

            }//: ZStack
            Spacer()

        }//: VStack
        .frame(height: 80)

    }//: ボディー
}

// MARK: - HomeTopBannerViewアイテム

private extension HomeTopBannerView {

    /// 背景の扇形部分
    private var backkGroundItem: some View {
        ZStack {
            HStack(alignment: .top, spacing: 0) {
                NavigationBackGround()
                    .fill(.navigationBar)
                    .frame(maxWidth: .infinity)
                    .frame(height: 15)
            }//: HStack
        }//: ZStack
    }

    /// バナー
    private var bannerItem: some View {
        Image(.homeBanner)
            .scaledToFit()
            .padding(.top, 40)
    }
}

// MARK: - プレビュー

#Preview {
    HomeTopBannerView()
}
