//
//  CategoryData.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/31.
//

import Foundation

class CategoryData: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}

typealias CategoryDatas = [CategoryData]
