//
//  BrandData.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/01.
//

import Foundation

struct BrandData: Codable, Identifiable {
    let id: Int
    let image: String
}

typealias BrandDatas = [BrandData]
