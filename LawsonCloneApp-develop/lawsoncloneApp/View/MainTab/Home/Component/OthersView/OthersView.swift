//
//  OthersView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/26.
//

import SwiftUI

struct OthersView: View {
    // MARK: - プロパティー
    /// 背景色
    private let backGroundColor = #colorLiteral(red: 0.8825963363, green: 0.9416703575, blue: 1, alpha: 0.703125)

    /// その他に表示するアイテム
    private var othersItem: [OthersItem] {
        return TestData.shared.othersItems
    }

    // MARK: - ボディー

    var body: some View {
        VStack {
            /// ヘッダー
            header

            /// コンテンツ
            contents
        }//: VStack
        .padding()
        .padding(.bottom, 100)
        .background(Color(backGroundColor))
    }//: ボディー

    // MARK: - メソッド

    /// グリッドのセットアップ
    /// - Returns: 設定を加えたグリッド
    func gridLayout() -> (columnSpace: CGFloat, columnSpacing: CGFloat, gridLayouts: [GridItem]) {
        let columnSpacing: CGFloat = 11
        let rowSpacing: CGFloat = 11
        var gridLayout: [GridItem] {
            return Array(repeating: .init(.adaptive(minimum: 50), spacing: rowSpacing), count: 4)
        }
        return (columnSpacing, rowSpacing, gridLayout)
    }
}

// MARK: - OthersViewアイテム

private extension OthersView {
    /// ヘッダー
    private var header: some View {
        HStack {
            Text("その他の機能")
                .font(.title3)
                .fontWeight(.semibold)
            Spacer()
        }
    }

    /// コンテンツ
    private var contents: some View {
        LazyVGrid(
            columns: gridLayout().gridLayouts,
            alignment: .center,
            spacing: gridLayout().columnSpacing,
            pinnedViews: [],
            content: {
                ForEach(othersItem) { item in
                    OthersItems(othersItem: item)
                }
            })
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    OthersView()
}
