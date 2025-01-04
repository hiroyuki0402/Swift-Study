//
//  NewItemViewItem.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/25.
//

import SwiftUI

struct NewItemViewItem: View {
    // MARK: - プロパティー

    var image: String

    // MARK: - ボディー

    var body: some View {
        HStack {
            /// 画像
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 70)

            VStack(alignment: .leading) {
                /// タイトル
                Text("スイーツスイーツスイーツ")
                    .lineLimit(2)
                    .font(.footnote)

                /// 金額
                Text("188円(税込)")
                    .lineLimit(2)
                    .foregroundColor(.gray)
                    .font(.footnote)

                /// 発売日
                Text("2023/11/21(火)発売")
                    .foregroundColor(.navigationBar)
                    .font(.system(size: 13))
            }
            .frame(width: 120)
        }
        .padding(.trailing, 20)
    }//: ボディー
}

#Preview {
    NewItemViewItem(image: "newItem")
}
