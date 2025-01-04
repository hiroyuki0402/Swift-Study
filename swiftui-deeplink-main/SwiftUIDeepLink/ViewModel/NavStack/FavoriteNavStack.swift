//
//  FavoriteNavStack.swift
//  SwiftUIDeepLink
//
//  Created by SHIRAISHI HIROYUKI on 2024/09/25.
//

enum FavoriteNavStack: String, CaseIterable {
    case shiraishi = "白石"
    case kuroishi = "黒石"
    case shiraiwa = "白岩"

    // FIXME: 汎用的に変更 rawValueを使用しない方法で変更
    var englishName: String {
        switch self {
        case .shiraishi:
            return "shiraishi"
        case .kuroishi:
            return "kuroishi"
        case .shiraiwa:
            return "shiraiwa"
        }
    }

    /// 可能であれば、文字列値を対応する`MainTab`ケースに変換
    /// - Parameter from: 変換するタブ名を表す文字列
    /// - Returns: 与えられた文字列に一致する`MainTab`
    static func convert(_ from: String) -> Self? {
        let lowercasedInput = from.lowercased()

        return FavoriteNavStack.allCases.first { tab in
            return tab.rawValue.lowercased() == lowercasedInput || tab.englishName.lowercased() == lowercasedInput
        }
    }
}
