//
//  CouponData.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/07.
//

import Foundation

struct CouponData: Identifiable, Codable {
    let id: String
    let image: String
    let type: Int
    let releaseDate: String
    let title: String
    let kbn: Int
    let discount: Int
    let endDate: String
    let genre: Int
}

typealias CouponDatas = [CouponData]

