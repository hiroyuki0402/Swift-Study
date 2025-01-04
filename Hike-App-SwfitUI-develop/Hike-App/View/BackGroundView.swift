//
//  BackGroundView.swift
//  Hike-App
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/09.
//

import SwiftUI

struct BackGroundView: View {
    /// 背景のグラデーションに使用される色の配列
    private let colors: [Color] = [
        .themaGreenLight,
        .themaGreenMedium
    ]

    var body: some View {
        // MARK: - Background Design
        ZStack {
            /// ダークグリーンの背景レイヤーを生成
            Color.themaGreenDark
                /// 角を丸くする
                .cornerRadius(40)
                /// y方向に少し下にずらして影のように見せる
                .offset(y: 12)

            /// ライトグレーの背景レイヤーを生成
            Color.themaGrayLight
                /// 角を丸くする
                .cornerRadius(40)
                /// y方向に少し下にずらす
                .offset(y: 3)
                /// 透明度を設定して背景が少し見えるようにする
                .opacity(0.85)

            /// グラデーションを追加する背景レイヤーを生成
            colors.addGradation(
                /// グラデーションの開始点を設定
                startpoint: .topTrailing,
                /// グラデーションの終了点を設定
                endPoint: .bottomTrailing)
                /// 角を丸くする
                .cornerRadius(40)
        }
    }
}


#Preview {
    BackGroundView()
        .padding()
}
