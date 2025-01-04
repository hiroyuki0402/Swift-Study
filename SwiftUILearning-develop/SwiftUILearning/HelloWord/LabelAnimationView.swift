//
//  LabelAnimationView.swift
//  SwiftUILearning
//
//  Created by SHIRAISHI HIROYUKI on 2023/04/09.
//

import SwiftUI

struct LabelAnimationView: View {
    let characters: [String]
    let baseTime: Double
    let textSize: Double
    @State var blurValue: Double = 10
    @State var opacity: Double = 0


    /// 初期化
    /// - Parameters:
    ///   - text: タイトル
    ///   - textSize: 文字サイズ
    ///   - startTime: アニメーションの時間
    init(text: String, textSize: Double, startTime: Double) {
        characters = Array(arrayLiteral: text)
        self.textSize = textSize
        baseTime = startTime
    }

    var body: some View {
        HStack(spacing: 1){
            ForEach(0..<characters.count,  id: \.self) { index in
                Text(String(self.characters[index]))
                    .font(.custom("HiraMinProN-W3", fixedSize: textSize))
                    .blur(radius: blurValue)
                    .opacity(opacity)
                    .animation(.easeInOut.delay( Double(index) * 0.15 ), value: blurValue)
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + baseTime) {
                if blurValue == 0{
                    blurValue = 10
                    opacity = 0.01
                } else {
                    blurValue = 0
                    opacity = 1
                }
            }
        }
    }
}
