//
//  PlayerData.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/30.
//

import Foundation

struct PlayerData: Decodable, Identifiable {
    var id: Int
    var image: String
}

typealias PlayerDatas = [PlayerData]
