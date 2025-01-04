//
//  ProductData.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/31.
//

import Foundation

struct ProductData: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let price: Int
    let description: String
    let color: [Double]

    var rgb: (red: Double, green: Double, blue: Double) {
        return (red: color[0], green: color[1], blue: color[2])
    }
}

typealias ProductDatas = [ProductData]

