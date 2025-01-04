//
//  VideoViewModel.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/27.
//

import Foundation
import SwiftUI

enum FileExtension {
    case mp4

    /// 拡張子の取得
    /// - Returns: 拡張子
    func getExtension() -> String {
        switch self {
        case .mp4:
            return "mp4"
        }
    }
}

class VideoViewModel: ObservableObject {

    // MARK: - プロパティー

    /// 動物のデータを保持する配列
    @Published var videoDatas: [VideosData] = []

    // MARK: - 初期化

    /// データの読み込みを行う
    init() {
        loadData()
    }

    // MARK: - メソッド

    /// `videos.json`から動物のデータを読み込み、`videoDatas`配列に格納する
    private func loadData() {
        if let decodeData = Bundle.main.decode("videos.json", type: Videos.self) {
            self.videoDatas = decodeData
        }
    }

    /// 指定されたインデックスの動物のデータを返す
    /// - Parameter index: 取得する動物のデータのインデックス
    /// - Returns: 指定されたインデックスに対応する動物のデータ
    func getVideosData(at index: Int) -> VideosData {
        return videoDatas[index]
    }

    /// データのシャッフル
    func shuffleData() {
        loadData()
        self.videoDatas.shuffle()
    }

}
