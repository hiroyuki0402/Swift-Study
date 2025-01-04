//
//  CoverImageView.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/22.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - プロパティー

    /// 表紙のイメージデータの配列を保持するプロパティ。
    var coverImageData: [CoverImageData]

    // MARK: - ボディ
    var body: some View {
        // タブビュー
        TabView {
            /// 各表紙のイメージデータに対して処理を繰り返し実行。
            ForEach(coverImageData) { item in
                /// 表紙のイメージを表示。イメージは動的にサイズ調整されてフィットするように設定。
                Image(item.name)
                     .resizable()
                     .scaledToFit()
            }
        }//: タブビュー
        .tabViewStyle(.page)
    }
}


#Preview {
    CoverImageView(coverImageData: CoverImageViewModel().coverImageDatas)
}
