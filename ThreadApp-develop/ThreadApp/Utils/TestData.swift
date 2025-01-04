//
//  TestData.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/22.
//

import Foundation
import Firebase

class TestData {
    static let shared = TestData()
    let userData: UserData = .init(id: UUID().uuidString, userName: "一郎", fullName: "テスト一郎", email: "testx@a.jp", bio: "iOS engineer")
    let userDatas: UserDatas = [
        .init(id: UUID().uuidString, userName: "一郎", fullName: "テスト一郎", email: "testx@a.jp", bio: "iOS engineer"),
        .init(id: UUID().uuidString, userName: "2郎", fullName: "テスト2郎", email: "testx@a2.jp", bio: "iOS engineer"),
        .init(id: UUID().uuidString, userName: "3郎", fullName: "テスト3郎", email: "testx@a3.jp", bio: "iOS engineer")
    ]
    let threadData: ThredData = .init(ownerID: "123", caption: "テストテストスレッドテスト", timeStamp: Timestamp(), likes: 0)
}
