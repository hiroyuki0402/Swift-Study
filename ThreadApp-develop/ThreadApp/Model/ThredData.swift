//
//  ThredData.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThredData: Identifiable, Codable {
    @DocumentID var thredId: String?
    let ownerID: String
    let caption: String
    let timeStamp: Timestamp
    var likes: Int

    var id: String {
        return thredId ?? UUID().uuidString
    }
    var userData: UserData?
}

typealias ThredDatas = [ThredData]
