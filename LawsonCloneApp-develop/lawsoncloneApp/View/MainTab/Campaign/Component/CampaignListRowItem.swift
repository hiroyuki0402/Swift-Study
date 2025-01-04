//
//  CampaignListRowItem.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/02.
//

import SwiftUI

// TODO: エントリー状況だしわけ

struct CampaignListRowItem: View {
    // MARK: - プロパティー
    var image: String
    
    // MARK: - ボディー

    var body: some View {
        VStack {
            HStack {
                /// 画像
                imageArea

                VStack {
                    /// エントリー
                    entryArea

                    /// メッセージ
                    messageArea

                    /// 期間
                    dateArea
                }//: VStac

            }//: HStack

        }//: VStack
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .background(.white)

    }//: ボディー
}
// MARK: - CampaignListRowItemアイテム

private extension CampaignListRowItem {
    /// 画像
    private var imageArea: some View {
        Image(image)
            .resizable()
            .frame(width: 100, height: 60)
    }

    /// エントリー状況エリア
    private var entryArea: some View {
        HStack {
            Text("未エントリー")
                    .foregroundColor(.blue)
                    .padding(3)
                    .padding(.horizontal, 5)
                    .fontWeight(.semibold)
                    .font(.caption)
                    .background(Color(uiColor: .systemGray6))
                    .cornerRadius(5)
            Spacer()
        }
        .padding(.leading, 5)
    }

    /// メッセージエリア
    private var messageArea: some View {
        HStack {
            Text("対象のお酒を買うと1本無料クーポンが当たる")
            Spacer()
        }
        .padding(.leading, 5)
        .font(.title3)
    }

    /// 日付エリア
    private var dateArea: some View {
        HStack {
            Text("期間")
                .foregroundStyle(.blue)
            Text("2023/11/28(火)〜2023/12/11(月)")
            Spacer()
        }
        .padding(.leading, 5)
        .font(.footnote)
    }
}

#Preview {
    CampaignListRowItem(image: "campaign")
}
