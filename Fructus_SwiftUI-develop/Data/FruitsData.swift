//
//  FruitsData.swift
//  Fructus
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/21.
//

import Foundation

struct FruitsData: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
