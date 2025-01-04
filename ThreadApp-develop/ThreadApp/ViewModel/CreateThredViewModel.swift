//
//  CreateThredViewModel.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/23.
//

import Foundation
import Firebase

class CreateThredViewModel: ObservableObject {
    func uploadThreads(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thredsData = ThredData(ownerID: uid, caption: caption, timeStamp: Timestamp(), likes: 0)
        try await ThredService.shared.uploadeThred(thredsData)
    }

}
