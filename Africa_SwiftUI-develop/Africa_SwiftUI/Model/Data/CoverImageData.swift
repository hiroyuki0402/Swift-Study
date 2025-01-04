//
//  CoverImageData.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/22.
//

import Foundation

struct CoverImageData: Codable, Identifiable {
    /// データの一意な識別子
    let id: Int

    /// カバーイメージの名前
    let name: String
}
