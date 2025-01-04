//
//  HomeNavStack.swift
//  SwiftUIDeepLink
//
//  Created by SHIRAISHI HIROYUKI on 2024/09/25.
//

enum HomeNavStack: String, CaseIterable {
    case myPost = "投稿"
    case oldPost = "過去の投稿"
    case latestPost = "最新の投稿"
    case deletedPost = "削除済みの投稿"

    // FIXME: 汎用的に変更 rawValueを使用しない方法で変更
    var englishName: String {
        switch self {
        case .myPost:
            return "myPost"
        case .oldPost:
            return "oldPost"
        case .latestPost:
            return "latestPost"
        case .deletedPost:
            return "deletedPost"
        }
    }

    /// 可能であれば、文字列値を対応する`MainTab`ケースに変換
    /// - Parameter from: 変換するタブ名を表す文字列
    /// - Returns: 与えられた文字列に一致する`MainTab`
    static func convert(_ from: String) -> Self? {
        let lowercasedInput = from.lowercased()

        return HomeNavStack.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased() || tab.englishName.lowercased() == lowercasedInput
        }
    }
}

