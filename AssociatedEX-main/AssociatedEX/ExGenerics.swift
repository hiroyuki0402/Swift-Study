//
//  ExGenerics.swift
//  AssociatedEX
//
//  Created by SHIRAISHI HIROYUKI on 2023/03/07.
//

import Foundation

class ApiManager {
    static let shared = ApiManager()
    func callApi<T: Codable>(url: URL?, type: T.Type, complisionHandler: @escaping ((Result<T, Error>) -> Void)) {
        guard let url = url else { return }
        let urlReqest = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlReqest) { data, _, error in
            session.finishTasksAndInvalidate()

            if let error = error {
                complisionHandler(.failure(error))
            }
            var resultData: T?
            do {
                if let data = data {
                    let decodeData = try JSONDecoder().decode(type.self, from: data)
                    resultData = decodeData
                }
            } catch let error {
                complisionHandler(.failure(error))
            }

            guard let result = resultData else { return }
            complisionHandler(.success(result))
        }
        task.resume()
    }
}


struct Model: Codable {
    let data: Item
}

struct Item: Codable {
    var name: String
    var note: String
    var age: Int
    var registerDate: String
}

