//
//  StringUtils.swift
//  TwitterCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2024/06/02.
//

import Foundation
import MyLibrary


/// 指定されたキーに対応するローカライズされた文字列を返すメソッド
/// - Parameters:
///   - key: ローカライズされた文字列を検索するキー
///   - tableName: 使用する.stringsファイルの名前、指定しない場合はnil
///   - value: キーに対応する文字列が見つからない場合に使用するデフォルト値
///   - comment: ローカライズファイル内での翻訳者向けのコメント
/// - Returns: 指定されたキーに基づいてローカライズされた文字列
public func localized(_ key: String, tableName: String? = nil, value: String = "", comment: String = "") -> String {
    let string = MyLibrary.localized(key, tableName: tableName, value: value, comment: comment)
    return string
}
