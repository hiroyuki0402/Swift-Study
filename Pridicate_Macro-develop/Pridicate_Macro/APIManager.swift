//
//  APIManager.swift
//  Pridicate_Macro
//
//  Created by SHIRAISHI HIROYUKI on 2023/09/25.
//

import Foundation

class APIManager {
    static let shred = APIManager()
    private init() {}

    func callAPI<T: Codable>(url: URL?, type: T.Type, complision: @escaping(Result<T?, Error>) -> Void) {

        guard let url = url else { return }
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, _, error in

            if let error = error {
                complision(.failure(error))
                return
            }

            if let data = data {
                let decodeData = try? JSONDecoder().decode(type.self, from: data)
                complision(.success(decodeData))
            }
        }
        task.resume()
    }
}
