import UIKit
import PlaygroundSupport
import Foundation

/// Async Sequence - ios academy

/// 画像をダウンロードするためのURL
let urlString = "https://source.unsplash.com/random"

/// Dataを生成するための非同期シーケンス
struct DataSequence: AsyncSequence {

    // シーケンスの要素型をDataに指定
    typealias Element = Data

    /// ダウンロードするURLの配列
    let urls: [URL]

    /// 初期化メソッド
    /// - Parameter urls: ダウンロードする画像のURL配列
    init(urls: [URL]) {
        self.urls = urls
    }

    /// 非同期イテレータを生成するメソッド
    /// - Returns: DataIterator
    func makeAsyncIterator() -> DataIterator {
        return DataIterator(urls: urls)
    }
}

/// Dataをダウンロードするための非同期イテレータ
struct DataIterator: AsyncIteratorProtocol {

    // イテレータの要素型をDataに指定
    typealias Element = Data

    /// 現在のインデックスを管理
    private var index = 0

    /// URLSessionを使用してデータをダウンロードするためのインスタンス
    private let urlSession = URLSession.shared

    /// ダウンロードするURLの配列
    let urls: [URL]

    /// 初期化メソッド
    /// - Parameter urls: ダウンロードする画像のURL配列
    init(urls: [URL]) {
        self.urls = urls
    }

    /// 次の要素を非同期に取得するメソッド
    /// - Returns: Data
    mutating func next() async throws -> Data? {
        // インデックスがURLの数を超えた場合はnilを返す
        guard index < urls.count else {
            return nil
        }

        // 次のURLを取得し、インデックスを更新
        let url = urls[index]
        index += 1

        // URLSessionを使用してデータを非同期にダウンロード
        let (data, _) = try await urlSession.data(from: url)

        return data
    }
}

/// メインタスク
Task {
    /// ダウンロードする画像の基本URL
    let string = "https://source.unsplash.com/random"

    /// ダウンロードする画像のURLを生成
    let urls: [URL] = Array(0...10).map {
        _ in URL(string: string)
    }.compactMap({
        $0
    })

    /// DataSequenceを使用して画像をダウンロードし、データの長さを出力
    for try await data in DataSequence(urls: urls) {
        print(data.count)
    }
}
