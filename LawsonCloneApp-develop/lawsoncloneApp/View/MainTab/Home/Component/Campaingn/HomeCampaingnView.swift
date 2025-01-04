//
//  CampaingnView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/25.
//

import SwiftUI

struct HomeCampaingnView: View {
    // MARK: - プロパティー
    @StateObject var campaignViewModel = CampaignViewModel()

    // MARK: - ボディー

    var body: some View {
        VStack {
            /// ヘッダー
            SectionHeader(title: "アプリで参加できるキャンペーン")

            /// コンテンツ
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(campaignViewModel.campaignDatas) { item in
                        CampaingnViewItem(campaignData: item)
                    }//: ForEach

                }//: HStack
                .padding(.trailing, 20)

            }//: ScrollView

        }//: VStack

    }//: ボディー
}

#Preview {
    HomeCampaingnView()
}
