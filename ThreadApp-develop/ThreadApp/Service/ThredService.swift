//
//  ThresService.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class ThredService {
    static let shared = ThredService()
    private let collection = "threads"

    @MainActor
    func uploadeThred(_ thred: ThredData) async throws {
        Logger.showLog("", greepWord: "Call API uploadeThred 出力開始")
        guard let threadData = try? Firestore.Encoder().encode(thred) else { return }
        try await Firestore.firestore().collection(collection).addDocument(data: threadData)
        Logger.showLog("アップロード正常終了: \(threadData)", greepWord: "Call API uploadeThred 出力終了")
    }

    @MainActor
    func fetchThreadDatas() async throws -> ThredDatas {
        Logger.showLog("", greepWord: "Call API fetchThreadDatas 出力開始")
        let snapShot = try await Firestore.firestore().collection(collection).order(by: "timeStamp", descending: true).getDocuments()
        let resultData = try snapShot.documents.compactMap { docment in
            let data = docment.data()
            return try Firestore.Decoder().decode(ThredData.self, from: data)
        }
        Logger.showLog("取得正常終了: \(resultData)", greepWord: "Call API fetchThreadDatas 出力終了")
        return resultData
    }
}
