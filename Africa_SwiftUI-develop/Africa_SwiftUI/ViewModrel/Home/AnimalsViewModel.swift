//
//  AnimalsViewModel.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/22.
//

import Foundation

class AnimalsViewModel {

    // MARK: - プロパティー

    /// 動物のデータを保持する配列
    var animalDatas: [AnimalsData] = []

    // MARK: - 初期化

    /// データの読み込みを行う
    init() {
        loadData()
    }

    // MARK: - メソッド

    /// `animals.json`から動物のデータを読み込み、`animalDatas`配列に格納する
    private func loadData() {
        if let decodeData = Bundle.main.decode("animals.json", type: [AnimalsData].self) {
            self.animalDatas = decodeData
        }
    }

    /// 指定されたインデックスの動物のデータを返す
    /// - Parameter index: 取得する動物のデータのインデックス
    /// - Returns: 指定されたインデックスに対応する動物のデータ
    func getAnimalData(at index: Int) -> AnimalsData {
        return animalDatas[index]
    }
}
