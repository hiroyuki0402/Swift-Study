import os
import Foundation

enum LogCategory: String {
    /// ネットワーク通信に関するログ
    case network = "ネットワーク"

    /// ユーザーインターフェースに関するログ
    case ui = "ユーザーインターフェース"

    /// JSONデコードやデータ変換に関するログ
    case decoding = "デコーディング"

    /// その他の全般的なログ
    case general = "全般"

    /// カテゴリに対応する Logger インスタンスを返す
    var logger: Logger {
        Logger(subsystem: subsystem, category: self.rawValue)
    }

    /// サブシステム名（通常は Bundle ID）
    private var subsystem: String {
        Bundle.main.bundleIdentifier ?? ""
    }
}

enum LoggerD {

    /// デバッグログを出力
    /// - Parameters:
    ///   - category: ログカテゴリ
    ///   - message: 出力するログメッセージ
    static func debug(_ category: LogCategory, _ message: String) {
        #if DEBUG
        category.logger.debug("\(message, privacy: .public)")
        #endif
    }

    /// 情報ログを出力
    /// - Parameters:
    ///   - category: ログカテゴリ
    ///   - message: 出力するログメッセージ
    static func info(_ category: LogCategory, _ message: String) {
        #if DEBUG
        category.logger.info("\(message, privacy: .public)")
        #endif
    }

    /// エラーログを出力（本番でも常に出力する）
    /// - Parameters:
    ///   - category: ログカテゴリ
    ///   - message: 出力するエラーメッセージ
    static func error(_ category: LogCategory, _ message: String) {
        category.logger.error("\(message, privacy: .public)")
    }
}
