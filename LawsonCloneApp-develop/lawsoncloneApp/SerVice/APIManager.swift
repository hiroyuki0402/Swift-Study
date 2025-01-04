//
//  APIManager.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class APIManager {

    /// APIManagerのシングルトンインスタン
    static let shred = APIManager()


    /// 指定されたURLからデータを非同期に取得し、指定された型にデコードする
    /// - Parameters:
    ///   - url: データを取得するためのURL。このURLがnilの場合、メソッドはエラーを投げる
    ///   - type: デコードする対象の型。この型はCodableプロトコルに準拠している必要がある
    /// - Returns: デコードされたデータ。データが存在しない、またはデコードに失敗した場合はnilを返す
    /// - Throws: ネットワークエラーまたはデコードエラー。URLがnilであるか、HTTPステータスコードが200範囲外である場合、またはデータのデコードに失敗した場合にエラーを投げる。
    func callAPI<T: Codable>(withUrl url: URL?, type: T.Type) async throws -> T? {
        /// URLがnilの場合はエラーを投げる
        guard let url = url else {
            throw URLError(.badURL)
        }

        /// URLセッションを使用してデータを取得
        let (data, response) = try await URLSession.shared.data(from: url)

        /// レスポンスがHTTPURLResponseであり、ステータスコードが200範囲内であることを確認
        guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        /// データを指定された型にデコード
        let decodedData = try JSONDecoder().decode(type.self, from: data)
        return decodedData
    }

    /// `TestData`インスタンスから指定された型のデータをロードする
    /// この関数は`Mirror`を使用して`TestData`のプロパティを反映し、
    /// 要求された型に一致する最初のデータを返す
    ///
    /// - Parameter type: ロードするデータの型を指定する`Codable`型
    ///   この型は、`TestData`クラスに存在するデータと一致する必要がある
    ///
    /// - Returns: 指定された型に一致するデータが存在する場合はそのデータを返す
    ///   一致するデータが存在しない場合は`nil`を返す
    ///
    ///   注意: この関数は`TestData`内に同じ型の複数のプロパティが存在する場合、
    ///   最初に見つかったプロパティのデータを返す
    ///   したがって、特定のプロパティ名でデータを取得する必要がある場合、
    ///   この関数は適していない可能性があり
    func loadTestData<T: Codable>(type: T.Type) -> T? {
        let mirror = Mirror(reflecting: TestData.shared)

        for child in mirror.children {
            if let value = child.value as? T {
                return value
            }
        }

        return nil
    }
    /// 指定されたFirestoreのコレクションから全てのドキュメントを非同期に取得し、指定された型にデコードする
    /// - Parameters:
    ///   - collectionPath: Firestore内のコレクションへのパス
    ///   - type: デコードする対象の型。この型はCodableプロトコルに準拠している必要がある
    /// - Returns: デコードされたデータの配列。データが存在しない、またはデコードに失敗した場合は空の配列を返す
    /// - Throws: Firestoreのエラー。コレクションが存在しない、またはデータのデコードに失敗した場合にエラーを投げる
    func fetchFirestoreCollection<T: Codable>(fromCollectionPath collectionPath: String, as type: T.Type) async throws -> [T] {
        let db = Firestore.firestore()
        let collectionRef = db.collection(collectionPath)

        let snapshot = try await collectionRef.getDocuments()
        return try snapshot.documents.compactMap { document in
            try document.data(as: type)
        }
    }
}
