//
//  Date -Extension.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/07.
//

import Foundation

enum DateFormat {
    case yyyyMMdd

    func format() -> String {
        switch self {
        case .yyyyMMdd:
            return "yyyy-MM-dd"
        }
    }
}


extension DateFormatter {

    /// 指定された日付の始まり（その日の0時0分0秒）を返すメソッド
    /// - Parameter date: 始まりの日時を取得するための日付
    /// - Returns: 指定された日付の0時0分0秒の時点での`Date`オブジェクト
    static func startOfDay(for date: Date) -> Date {
        return Calendar.current.startOfDay(for: date)
    }

    /// 指定された日付文字列が現在から指定された日数以内かどうかを判断する
    /// - Parameters:
    ///   - releaseDateString: チェックする日付文字列
    ///   - format: 日付のフォーマット
    ///   - days: 現在日からの日数
    /// - Returns: 指定された日数以内であればtrue, そうでなければfalse
    static func isWithinDays(from releaseDateString: String, format: DateFormat, days: Int) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.format()

        guard let releaseDate = dateFormatter.date(from: releaseDateString) else {
            return false
        }

        let currentDate = Date()

        if let targetDate = Calendar.current.date(byAdding: .day, value: days, to: releaseDate) {
            return currentDate <= targetDate
        }

        return false
    }
    /// 指定された終了日から指定された日数以内かどうかを判断し、残り日数も返す
    /// - Parameters:
    ///   - endDateString: 終了日の日付文字列
    ///   - format: 日付のフォーマット
    ///   - days: 終了日からの日数
    /// - Returns: 終了日が指定された日数以内であれば(true, 残り日数)、そうでなければ(false, nil)
    static func isWithinDaysToEndDate(from endDateString: String, format: DateFormat, days: Int) -> (Bool, Int?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.format()

        guard let endDate = dateFormatter.date(from: endDateString) else {
            return (false, nil)
        }

        let currentDate = startOfDay(for: Date())

        if let thresholdDate = Calendar.current.date(byAdding: .day, value: -days, to: endDate),
           currentDate >= thresholdDate {
            let remainingDays = Calendar.current.dateComponents([.day], from: currentDate, to: endDate).day ?? 0
            return (true, remainingDays)
        }

        return (false, nil)
    }
    /// 日付の文字列を "年/月/日(曜日)" の形式に変換する
    ///
    /// このメソッドは、指定された文字列形式の日付を解析し、日本のロケールに適したフォーマットに変換します。
    ///
    /// - Parameter dateString: 変換する日付の文字列。"yyyy-MM-dd" 形式である必要があります。
    /// - Returns: 変換された日付の文字列。例："2023/12/4(月)"。変換に失敗した場合はnilを返します。
    ///
    /// 使用例：
    /// ```
    /// let dateString = "2023-12-04"
    /// if let formattedDate = DateFormatter.toCustomDateString(from: dateString) {
    ///     print(formattedDate) ⇨ "2023/12/4(月)"
    /// }
    /// ```
    static func toCustomDateString(from dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd" // 入力される日付の形式
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")

        guard let date = inputFormatter.date(from: dateString) else {
            return ""
        }

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy/MM/dd(E)" // 出力する日付の形式
        outputFormatter.locale = Locale(identifier: "ja_JP") // 日本のロケールを設定
        return outputFormatter.string(from: date)
    }
}
