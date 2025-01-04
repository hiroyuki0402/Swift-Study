//
//  ViewModelDataLoadable.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/08.
//

import Foundation

// MARK: - ViewModel Data Loading Protocol

protocol ViewModelDataLoadable {
    /// このプロトコルに準拠する ViewModel が操作するデータの型
    associatedtype DataType: Codable

    /// データソースからデータをロードし、`data` 配列を更新
    func loadData()

    /// 特定のインデックスにあるデータを取得
    /// - Parameter index: 取得するデータの配列内のインデックス
    /// - Returns: 指定されたインデックスの `DataType` オブジェクト
    func getData(at index: Int) throws -> DataType

    /// 新しいデータを保存または既存のデータを更新
    /// - Parameter item: 保存または更新する `DataType` オブジェクト
    func saveData(_ item: DataType)

    /// 特定のインデックスのデータを削除
    /// - Parameter index: 削除するデータの配列内のインデックス
    func deleteData(at index: Int) throws
}

enum ViewModelError: Error {
    case indexOutOfRange
}
