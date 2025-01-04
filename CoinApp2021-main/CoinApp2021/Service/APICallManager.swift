//
//  APICallManager.swift
//  CoinApp2021
//
//  Created by SHIRAISHI HIROYUKI on 2021/10/02.
//

import Foundation

class APICallManager {
    static let shared = APICallManager()

    func callAPi<T: Codable>(url: URL?, type: T.Type, complision: @escaping(Result<T, Error>) -> Void) {

        guard let url = url else { return }
        let reqestUrl = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: reqestUrl) { data, _, error in
            session.finishTasksAndInvalidate()

            if let error = error {
                complision(.failure(error))

            }

            if let data = data {
                guard let decodeData = try? JSONDecoder().decode(type.self, from: data) else { return }
                complision(.success(decodeData))
            }
        }

        task.resume()
    }
}
