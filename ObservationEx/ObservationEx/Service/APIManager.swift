import SwiftUI


struct APIManager {
    static let shared = APIManager()
    private init() {}

    /// 指定されたURLからデータを取得して指定の型にデコードして返す
    /// - Parameters:
    ///   - url: APIのエンドポイントURL
    ///   - type: デコードする型
    /// - Returns: 指定型のデコード
    func call<T: Codable>(_ url: URL?, type: T.Type) async throws -> T {
        LoggerD.debug(.network, "API呼び出し開始")
        guard let url else {
            LoggerD.error(.network, "エラー: { \(URLError(.badURL)) }")
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              statusCheck(value: httpResponse.statusCode, from: 200, to: 299) else {
            LoggerD.error(.network, "エラー: { \(URLError(.badServerResponse)) }")
            throw URLError(.badServerResponse)
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let data = try decoder.decode(type.self, from: data)
            LoggerD.debug(.network, "レスポンス: { \(data) }")
            return data
        } catch {
            LoggerD.error(.network, "エラー: { \(error) }")
            throw error
        }
    }

    
    /// 指定した範囲内に値が含まれているかを判定する
    /// - Parameters:
    ///   - value: 判定したい数値
    ///   - from: 範囲の下限（含む）
    ///   - to: 範囲の上限（含む）
    /// - Returns: from～to の間にあるか
    private func statusCheck(value: Int, from: Int, to: Int) -> Bool {
        return from...to ~= value
    }

}
