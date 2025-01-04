//
//  UserService.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var curentUser: UserData?
    static let shared = UserService()

    init() {
        Task {
            try await UserService.shared.fetchCurrentUserData()
        }
    }

    @MainActor
    func fetchCurrentUserData() async throws {
        guard let uid  = Auth.auth().currentUser?.uid else { return }
        do {
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            let data = try snapshot.data(as: UserData.self)
            curentUser = data
            Logger.showLog(data, greepWord: "CallAPI FetchCurrentUserData")
        } catch {
            Logger.showLog(error, greepWord: "CallAPI Error")
        }
    }

    @MainActor
    func fetchCurrentUserDatas() async throws -> UserDatas {
        guard let currentUid  = Auth.auth().currentUser?.uid else { return [] }
        let querySnapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = querySnapshot.documents
        let resultsData = try documents.compactMap { document in
            let data = document.data()
            return try Firestore.Decoder().decode(UserData.self, from: data)
        }

        Logger.showLog(resultsData, greepWord: "CallAPI FetchCurrentUserDatas")
        return resultsData.filter { $0.id != currentUid }
    }

    func reset() {
        self.curentUser = nil
    }

    @MainActor
    func updateUserProfileImage(withIMageUrl imageURl: String) async throws {
        guard let currentUid  = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(currentUid).updateData([
            "profileImageUrl": imageURl
        ])
        curentUser?.profileImageUrl = imageURl
    }
}
