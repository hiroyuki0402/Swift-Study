//
//  NewItemView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/25.
//

import SwiftUI

struct NewItemView: View {
    // MARK: - プロパティー
    private var newItems: [String] {
        return TestData.shared.newItems
    }

    // MARK: - ボディー

    var body: some View {
        VStack {
            /// ヘッダー
            SectionHeader(title: "新商品")

            /// コンテンツ
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(
                    rows: gridLayout().gridLayouts,
                    alignment: .center,
                    spacing: gridLayout().rowSpacing,
                    pinnedViews: [],
                    content: {

                        ForEach(newItems, id: \.self) { item in
                            NewItemViewItem(image: item)

                        }})//: Section
                .frame(height: 220)
                .frame(maxWidth: .infinity)
            }

            /// 注意書き
            Text("※地域によって取り扱いがない商品、仕様などが異なる商品がございます。必ず商品詳細をご確認ください。")
                .padding(.top, 4)
                .padding(.trailing, 20)
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }

    // MARK: - メソッド

    /// グリッドのセットアップ
    /// - Returns: 設定を加えたグリッド
    func gridLayout() -> (coulumnSpace: CGFloat, rowSpacing: CGFloat, gridLayouts: [GridItem])  {
        let columnSpacing: CGFloat = 11
        let rowSpacing: CGFloat = 11
        var gridLayout: [GridItem] {
            return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 3)
        }
        return (columnSpacing, rowSpacing, gridLayout)
    }
}

#Preview {
    NewItemView()
}
