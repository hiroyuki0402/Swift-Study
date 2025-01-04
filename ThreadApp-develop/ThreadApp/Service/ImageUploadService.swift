//
//  ImageUploadService.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/23.
//

import Foundation
import Firebase
import FirebaseStorage

class ImageUploadService {
    static let shared = ImageUploadService()


    /// FireBaseStorageに画像をアップロードする
    /// - Parameter image: アップロードする画像
    /// - Returns: アップロードした場所のURlLの文字列
    func uploadeImage(_ image: UIImage) async throws -> String? {
        Logger.showLog("", greepWord: "Call API UploadImage 出力開始")
        let imageQuality: CGFloat = 0.25
        guard let imageData = image.jpegData(compressionQuality: imageQuality) else { return nil }
        let directory = "/profile_images/"
        let fileName = NSUUID().uuidString
        let path = directory + fileName
        let storage = Storage.storage().reference(withPath: path)

        do {
            let _ = try await storage.putDataAsync(imageData)
            let url = try await storage.downloadURL()
            Logger.showLog("正常終了: URL[ \(url) ]", greepWord: "Call API UploadImage 出力終了")
            return url.absoluteString
        } catch {
            Logger.showLog("エラー", greepWord: "Call API UploadImage 出力終了")
            return nil
        }
    }
}
