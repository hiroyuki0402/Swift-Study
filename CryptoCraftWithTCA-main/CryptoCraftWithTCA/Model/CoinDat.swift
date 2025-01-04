//
//  CoinDat.swift
//  CryptoCraftWithTCA
//
//  Created by SHIRAISHI HIROYUKI on 2024/04/06.
//

import Foundation

struct CoinData: Codable {
    let currency: String
    let price: String
}

typealias CoinDatas = [CoinData]
extension CoinData: Equatable { }
extension CoinData: Hashable { }
