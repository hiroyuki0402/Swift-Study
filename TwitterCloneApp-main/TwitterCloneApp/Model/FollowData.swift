//
//  FollowData.swift
//  TwitterCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2024/06/08.
//

import Foundation

struct FollowData: Codable {
    let userID: String
    let nickName: String
    let message: String
    let imageUrl: String
    let mainImageUrl: String
}

typealias FollowDatas = [FollowData]
extension FollowData: Hashable {}
