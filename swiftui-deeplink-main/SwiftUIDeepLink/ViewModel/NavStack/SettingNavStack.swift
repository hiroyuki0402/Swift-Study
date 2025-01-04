//
//  SettingNavStack.swift
//  SwiftUIDeepLink
//
//  Created by SHIRAISHI HIROYUKI on 2024/09/25.
//

enum SettingNavStack: String, CaseIterable {
    case profile = "プロフィール"
    case dataUsage = "データの使用状況"
    case privacyPolicy = "ポリシー"
    case termsOfService = "利用規約"

    // FIXME: 汎用的に変更 rawValueを使用しない方法で変更
    var englishName: String {
        switch self {
        case .profile:
            return "profile"
        case .dataUsage:
            return "dataUsage"
        case .privacyPolicy:
            return "privacyPolicy"
        case .termsOfService:
            return "termsOfService"
        }
    }

    /// 可能であれば、文字列値を対応する`MainTab`ケースに変換
    /// - Parameter from: 変換するタブ名を表す文字列
    /// - Returns: 与えられた文字列に一致する`MainTab`
    static func convert(_ from: String) -> Self? {
        let lowercasedInput = from.lowercased()

        return SettingNavStack.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased() || tab.englishName.lowercased() == lowercasedInput
        }
    }
}

