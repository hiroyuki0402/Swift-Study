//
//  CommonNavigarionBar.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/29.
//

import SwiftUI

struct CommonNavigationBarView: View {
    // MARK: - プロパティー

    var icon: String
    var isRightItemShow: Bool = false
    var isLeftItemShow: Bool = false

    // MARK: - ボディー
    var body: some View {

        /// ツールバーのアイテムを定義
        HStack {
            if isRightItemShow && isLeftItemShow {
                leftItem
                Spacer()
                rightItem
            }

            if isRightItemShow && !isLeftItemShow {
                rightItem
                Spacer()
            }

            if !isRightItemShow && isLeftItemShow {
                Spacer()
                leftItem
            }


        }
        .padding()
    }//: ボディー
}

private extension CommonNavigationBarView {
    private var rightItem: some View {
        /// 設定ボタン
        Image(systemName: "gearshape")
            .resizable()
            .font(.callout)
            .padding(2)
            .frame(width: 24, height: 24)
            .foregroundColor(.white)
    }

    private var leftItem: some View {
        /// お知らせボタン
        Image(systemName: "bell")
            .resizable()
            .font(.callout)
            .padding(4)
            .frame(width: 24, height: 24)
            .background(.white)
            .clipShape(Circle())
            .foregroundColor(.blue)
    }
}


#Preview {
    CommonNavigationBarView(icon: "bell", isRightItemShow: false, isLeftItemShow: true)
}
