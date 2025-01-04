//
//  VideosData.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/22.
//

import Foundation

struct VideosData: Codable, Identifiable {

    /// ビデオデータの一意な識別子
    let id: String

    /// ビデオの名前またはタイトル
    let name: String

    /// ビデオに関する短い見出しまたは説明
    let headline: String
}

typealias Videos = [VideosData]
