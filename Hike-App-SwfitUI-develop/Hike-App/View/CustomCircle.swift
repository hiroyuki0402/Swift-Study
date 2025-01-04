//
//  CustomCircle.swift
//  Hike-App
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/09.
//

import SwiftUI

struct CustomCircle: View {
    /// `isGradient` はグラデーションの開始と終了ポイントを切り替えるための状態変数
    @State private var isGradient: Bool = false

    /// グラデーションに使用する2色の配列
    private let circleColors: [Color] = [
        .colorIndigoMedium,
        .colorSalmonLight
    ]

    var body: some View {
        // MARK: - Circle Section

        ZStack {
            /// 円形のビューを生成
            Circle()
            /// 上記で定義された2色のグラデーションをこの円に適用
                .fill(
                    circleColors.addGradation(
                        /// `isGradient`の値に基づいて、グラデーションの開始点を決定
                        startpoint: isGradient ? .topLeading: .bottomLeading,

                        /// `isGradient`の値に基づいて、グラデーションの終了点を決定
                        endPoint: isGradient ? .bottomTrailing: .topTrailing))
            /// このビューが画面に表示される際のアクション
                .onAppear {
                    /// グラデーションの開始と終了ポイントを3秒ごとに切り替えるアニメーション
                    withAnimation(

                        /// 線形のアニメーションを使用し、3秒の間隔で動作
                        .linear(duration: 3.0)

                        /// アニメーションを永続的に繰り返し、その際に前後を反転する
                        .repeatForever(autoreverses: true)) {
                            /// `isGradient`の値をトグルすることで、グラデーションの開始と終了点を切り替え
                        isGradient.toggle()
                    }
            }
        // MARK: - Motion Animation Section

        /// 動的なアニメーションを表示するビュー
        MotionAnimation()
        }
        /// ZStack全体のサイズを指定
        .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircle()
}
