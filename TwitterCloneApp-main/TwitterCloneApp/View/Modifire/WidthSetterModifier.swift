//
//  WidthSetterModifier.swift
//  TwitterCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2024/06/07.
//

import Foundation
import SwiftUI

struct WidthSetterModifier: ViewModifier {
    /// ビューの幅を外部から制御するためのバインディング変数
    @Binding var width: CGFloat
    
    /// 幅計算時に考慮するマージン値
    var margin: CGFloat

    // MARK: - ボディー
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .preference(key: ViewWidthKey.self, value: geometry.size.width - margin)
                }
            )
            /// 新しい幅が計算されたときにバインディング変数を更新
            .onPreferenceChange(ViewWidthKey.self) { newWidth in
                self.width = newWidth
            }
    }
}

struct ViewWidthKey: PreferenceKey {
    /// デフォルトの幅の値を0に設定
    static var defaultValue: CGFloat = 0
    
    /// 複数のビューから送られた幅の値を集約し、最大値を取得
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}
