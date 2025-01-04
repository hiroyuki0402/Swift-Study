//
//  FooterView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/29.
//

import SwiftUI

struct FooterView: View {

    // MARK: - プロパティー

    // MARK: - ボディー

    var body: some View {
        /// フッタービューの縦方向のスタック
        VStack(alignment: .center, spacing: 10) {
            /// メッセージ
            Text(NSLocalizedString("HomeFooterViewMessage", comment: ""))
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .layoutPriority(2)

            /// アイコン
            Image(.logoLineal)
                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray)
        }//: VStack
        .padding()
    }//: ボディー
}

#Preview {
    FooterView()
}
