import Foundation

enum NetworkError: Error {
    case invalidURL
}

enum APIError: Error {
    case invalidResponse
}

class Service {
    static var shared: Service = .init()

    private init() {}

    func callApi<T: Codable>(urlStr: String, type: T.Type) async throws -> T {
        guard let url = URL(string: urlStr) else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        let httpResponse = response as! HTTPURLResponse

        guard (200..<300).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }
        
        return try JSONDecoder().decode(type.self, from: data)
    }
}
