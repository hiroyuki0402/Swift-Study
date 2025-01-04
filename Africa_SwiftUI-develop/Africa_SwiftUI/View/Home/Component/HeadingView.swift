//
//  HeadingView.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/25.
//

import SwiftUI

struct HeadingView: View {
    // MARK: - プロパティー
    
    /// ヘッダーに表示するイメージの名前
    var headingImage: String

    /// ヘッダーに表示するテキスト
    var headingText: String

    // MARK: - ボディ

    var body: some View {
        /// 水平方向のスタックでヘッダーのイメージとテキストを表示
        HStack {
            /// システムイメージを表示し、アクセントカラーで色付け
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)

            /// ヘッダーのテキストを表示
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)

        }//: HStack
        .padding(.vertical)
    }//: ボディ
}


#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "写真の中の自然")
        .previewLayout(.sizeThatFits)
        .padding()
}
