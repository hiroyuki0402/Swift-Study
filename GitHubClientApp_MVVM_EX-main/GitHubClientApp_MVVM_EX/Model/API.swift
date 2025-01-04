//
//  API.swift
//  GitHubClientApp_MVVM_EX
//
//  Created by SHIRAISHI HIROYUKI on 2022/03/08.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case unknown , invalidURL, invalidResponse

    var description: String {
        switch self {
        case .unknown:
            return "不明なエラーです"
        case .invalidURL:
            return "無効なURLです"
        case .invalidResponse:
            return "フォーマットが無効なレスポンスを受け取りました"
        }
    }
}

class API {

    func getUser(complision: @escaping (Result<[User], Error>) -> Void) {

        let requestURL = URL(string: "https://api.github.com/users")
        guard let url = requestURL else {
            complision(.failure(APIError.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.timeoutInterval = 10

        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let task = session.dataTask(with: request) { data, response, err in

            if let err = err {
                complision(.failure(err))
            } else if let data = data {
                do {
                    let jsonOptional = try JSONDecoder().decode(User.self, from: data)
                    print(jsonOptional)
                    complision(.success([jsonOptional.self]))
                } catch {
                    complision(.failure(APIError.unknown))
                }
            } else {
                complision(.failure(APIError.unknown))
            }
            
        }
        task.resume()


    }

}
