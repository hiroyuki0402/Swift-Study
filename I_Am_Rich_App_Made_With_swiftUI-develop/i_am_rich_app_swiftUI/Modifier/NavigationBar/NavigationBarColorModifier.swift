//
//  NavigationBarColorModifier.swift
//  i_am_rich_app_swiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/09/23.
//

import Foundation
import SwiftUI

struct NavigationBarColorModifier: ViewModifier {
    var backgroundColor: Color

    /// 初期化
    /// - Parameter backgroundColor: ナビゲーションバーの背景色
    init(backgroundColor: Color) {

        /// バックグラウンドカラーを設定
        self.backgroundColor = backgroundColor

        /// ナビゲーションバーの外観を設定
        let appearance = UINavigationBarAppearance()

        /// 不透明な背景を持つ外観に設定
        appearance.configureWithOpaqueBackground()

        /// 背景色を設定
        appearance.backgroundColor = UIColor(backgroundColor)

        /// タイトルのテキスト属性を設定（白色）
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]

        /// スクロールエッジ時の外観を設定
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        /// 標準の外観を設定
        UINavigationBar.appearance().standardAppearance = appearance
    }

    /// 
    /// - Parameter content: 表示するビュー
    /// - Returns: 変更後のビュー
    func body(content: Content) -> some View {
        content
    }
}
