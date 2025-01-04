//
//  MainTab.swift
//  SwiftUIDeepLink
//
//  Created by SHIRAISHI HIROYUKI on 2024/09/25.
//

import SwiftUI

enum MainTab: String, CaseIterable {
    /// ホーム画面
    case home = "Home"

    /// お気に入り画面
    case favorite = "Favorite"

    /// 設定画面
    case settings = "Settings"

    /// 各タブに対応するシンボル名
    var symbolName: String {
        switch self {
        case .home:
            return "house.fill"
        case .favorite:
            return "heart.fill"
        case .settings:
            return "gear"
        }
    }

    /// 可能であれば、文字列値を対応する`MainTab`ケースに変換
    /// - Parameter from: 変換するタブ名を表す文字列
    /// - Returns: 与えられた文字列に一致する`MainTab`
    static func convert(_ from: String) -> Self? {
        /// 文字列を処理して、小文字に変換されたバージョンを比較することで対応する`MainTab`ケースを探す
        return MainTab.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}

