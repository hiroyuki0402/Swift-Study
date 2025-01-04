//
//  lowsonAppdescription.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/25.
//

import SwiftUI

struct LowsonAppdescription: View {
    // MARK: - プロパティー

    // MARK: - ボディー
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                /// タイトル
                titleItem

                /// 日付
                dateItem
            }//: VStack
            .font(.footnote)
            .padding(5)

            /// スペーサー
            Spacer()

            /// 詳細ボタン
            detaileButton
        }//: HStack
        .background(Rectangle().stroke(.gray, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
        .padding(5)
    }//: ボディー
}

// MARK: - LowsonAppdescriptionアイテム

private extension LowsonAppdescription {

    /// タイトル
    private var titleItem: some View {
        Text("ローソンアプリのログインについて")
    }

    /// 日付
    private var dateItem: some View {
        Text("2023/11/20(月)")
            .foregroundColor(.gray)
    }

    /// 詳細ボタン
    private var detaileButton: some View {
        Button {

        } label: {
            Text("詳細")
                .font(.system(size: 17))
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
        }
        .padding(.horizontal)
    }
}

#Preview {
    LowsonAppdescription()
}
