//
//  WhoToFollowData.swift
//  TwitterCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2024/06/06.
//

import Foundation

struct WhoToFollowData: Codable {
    let userID: String
    let nickName: String
    let message: String
    let imageUrl: String
}

typealias WhoToFollowDatas = [WhoToFollowData]
extension WhoToFollowData: Hashable {}
