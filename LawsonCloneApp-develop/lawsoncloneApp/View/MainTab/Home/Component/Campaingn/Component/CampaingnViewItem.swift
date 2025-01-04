//
//  CampaingnViewItem.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/25.
//

import SwiftUI

struct CampaingnViewItem: View {
    // MARK: - プロパティー
    var campaignData: CampaignData
    @State private var isWebViewPresented = false

    // MARK: - ボディー

    var body: some View {
        VStack {
            /// 画像
            contentsImage

            /// 説明文
            contentsDescripsion

            /// 応募ステータス
            contentsEnd

        }//: VStack
        .frame(width: 150, height: 170)
        .onTapGesture {
            isWebViewPresented.toggle()
        }
        .fullScreenCover(isPresented: $isWebViewPresented) {
            if let url = campaignData.url {
                // TODO: - 不安定のため見直す
                WebViewContainer(url: url)
            }
        }

    }//: ボディー

    private func isStatus() -> Bool {
        /// 終了どうかを判定
        return DateFormatter.isWithinDaysToEndDate(from: campaignData.endDate, format: .yyyyMMdd, days: 0).0
    }
}

// MARK: - CampaingnViewItemアイテム

private extension CampaingnViewItem {
    /// コンテンツの画像
    private var contentsImage: some View {
        Image(campaignData.image)
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 100)
    }

    /// 説明
    private var contentsDescripsion: some View {
        Text(campaignData.title)
            .lineLimit(2)
            .font(.footnote)
    }

    /// 応募ステータス
    private var contentsEnd: some View {
        HStack {
            Text("応募終了")
                .foregroundColor(.white)
                .padding(3)
                .fontWeight(.semibold)
                .font(.caption)
                .background(Color(uiColor: .systemGray5))
                .clipShape(.capsule)
                .opacity(isStatus() ? 1.0: 0)
            Spacer()
        }
    }
}

#Preview {
    CampaingnViewItem(campaignData: CampaignViewModel().campaignDatas[0])
}
