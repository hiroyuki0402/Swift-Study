//
//  MapViewModel.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/28.
//

import Foundation

class MapViewModel: ObservableObject {

    // MARK: - プロパティー

    /// 動物のデータを保持する配列
    @Published var mapDatas: MapDatas = []

    // MARK: - 初期化

    /// データの読み込みを行う
    init() {
        loadData()
    }

    // MARK: - メソッド

    /// `map.json`から地図のデータを読み込み、`mapDatas`配列に格納する
    private func loadData() {
        if let decodeData = Bundle.main.decode("locations.json", type: MapDatas.self) {
            self.mapDatas = decodeData
        }
    }

    /// 指定されたインデックスの動物のデータを返す
    /// - Parameter index: 取得するマップのデータのインデックス
    /// - Returns: 指定されたインデックスに対応するマップのデータ
    func getAnimalData(at index: Int) -> MapData {
        return mapDatas[index]
    }
}
