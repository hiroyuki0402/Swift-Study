//
//  CoverImageViewModel.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/22.
//

import Foundation

class CoverImageViewModel {
    // MARK: - プロパティー

    /// カバー画像のデータを保持する配列
    var coverImageDatas: [CoverImageData] = []

    // MARK: - 初期化

    /// データの読み込みを行う
    init() {
        loadData()
    }

    // MARK: - メソッド

    /// `covers.json`からカバー画像のデータを読み込み、`coverImageDatas`配列に格納する
    private func loadData() {
        if let decodeData = Bundle.main.decode("covers.json", type: [CoverImageData].self) {
            self.coverImageDatas = decodeData
        }
    }

    /// 指定されたインデックスのカバー画像のデータを返す
    /// - Parameter index: 取得するカバー画像のデータのインデックス
    /// - Returns: 指定されたインデックスに対応するカバー画像のデータ
    func getAnimalData(at index: Int) -> CoverImageData {
        return coverImageDatas[index]
    }
}
