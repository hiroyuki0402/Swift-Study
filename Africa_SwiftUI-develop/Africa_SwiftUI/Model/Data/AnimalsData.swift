//
//  AnimalsData.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/22.
//

import Foundation

struct AnimalsData: Codable, Identifiable {
    /// 動物データの一意な識別子
    let id: String

    /// 動物の名前
    let name: String

    /// 動物に関する短い見出しまたは説明
    let headline: String

    /// 動物に関する詳細
    let description: String

    /// 動物に関する詳細情報へのリンク
    let link: String

    /// 動物の画像へのパスまたはURL
    let image: String

    /// 動物のギャラリー画像の配列
    let gallery: [String]

    /// 動物に関する興味深い事実の配列
    let fact: [String]
}

