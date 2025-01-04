//
//  CoinData.swift
//  CoinApp2021
//
//  Created by SHIRAISHI HIROYUKI on 2021/10/02.
//

import Foundation

// MARK: - CoinDatum
struct CoinDatum: Codable {
    let currency: String
    let price: String
}

typealias CoinData = [CoinDatum]

