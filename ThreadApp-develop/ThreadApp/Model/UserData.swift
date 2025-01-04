//
//  UserData.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/19.
//

import Foundation

struct UserData: Identifiable, Codable, Hashable {
    let id: String
    let userName: String
    let fullName: String
    let email: String
    var profileImageUrl: String?
    var bio: String?
}

typealias UserDatas = [UserData]
