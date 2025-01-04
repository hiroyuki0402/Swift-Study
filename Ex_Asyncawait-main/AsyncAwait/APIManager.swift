//
//  APIManager.swift
//  AsyncAwait
//
//  Created by SHIRAISHI HIROYUKI on 2023/05/07.
//

import Foundation

class APIManager {

    class func callApi<T: Codable>(url: URL?, type: T.Type) async -> T? {
        guard let url = url else { return nil}

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(type.self, from: data)
            return response
        }
        catch let error {
            print("失敗内容:\(error)")
            return nil
        }
    }
}
