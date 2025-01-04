//
//  Logger.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/19.
//

import Foundation
import UIKit


class Logger {
    /// デバッグビルド時のみオブジェクトの詳細を出力するメソッド
    /// - Parameters:
    ///   - value: 出力するオブジェクト
    ///   - file: ログを出力するファイル名
    ///   - function: ログを出力する関数名
    ///   - line: ログを出力する行番号
    class func showLog<T>(_ value: T, file: String = #file, function: String = #function, line: Int = #line, greepWord: String) {
#if DEBUG
        print("\(greepWord) 出力開始: ")
        let fileName = (file as NSString).lastPathComponent
        print("[\(fileName):\(line)] \(function):")
        dump(value)
        print("\(greepWord) 出力終了: ")
#endif
    }
}

