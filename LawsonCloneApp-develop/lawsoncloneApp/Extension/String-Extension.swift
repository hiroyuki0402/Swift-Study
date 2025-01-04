//
//  String-Extension.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/16.
//

import Foundation

extension String {
    /// この文字列を "年/月/日(曜日)" の形式に変換する
    /// 無効な日付の場合は空の文字列を返す
    /// - Returns: 変換された日付の文字列、または無効な日付の場合は空の文字列
    func toCustomDateString() -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")

        guard let date = inputFormatter.date(from: self) else {
            return ""
        }

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy/MM/dd(E)"
        outputFormatter.locale = Locale(identifier: "ja_JP")
        return outputFormatter.string(from: date)
    }
}
