//
//  CustomButton.swift
//  Hike-App
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/09.
//

import SwiftUI

struct CustomButton: View {
    /// ボタンの背景に使用されるグラデーション色の配列
    private let buttonGradientColors: [Color] = [
        .white,
        .colorGreenLight,
        .colorGreenMedium
    ]

    /// ボタンの縁のグラデーションに使用される色の配列
    private let circleColors: [Color] = [
        .colorGrayLight,
        .colorGrayMedium
    ]

    var body: some View {
        // MARK: - Button Design
        ZStack {
            /// 円形の背景を生成
            Circle()
                /// 背景の円にグラデーションを適用
                .fill(buttonGradientColors.addGradation())

            /// 円形のボーダー(縁取り)を生成
            Circle()
                /// ボーダーの円にグラデーションを適用
                .stroke(circleColors.addGradation())

                /// ボーダーの文字の太さを黒に設定（この部分はおそらく不要な可能性が高いです）
                .fontWeight(.black)

            /// ボタンの中央に表示するアイコン
            Image(systemName: "figure.hiking")
                /// アイコンの文字の太さを黒に設定
                .fontWeight(.black)

                /// アイコンのフォントサイズを設定
                .font(.system(size: 30))
            
                /// アイコンの色をグラデーションに設定
                .foregroundStyle(circleColors.addGradation())
        }
        /// ZStack全体のサイズを指定
        .frame(width: 58, height: 58)
    }
}

#Preview {
    CustomButton()
        .previewLayout(.sizeThatFits)
        .padding()
}
