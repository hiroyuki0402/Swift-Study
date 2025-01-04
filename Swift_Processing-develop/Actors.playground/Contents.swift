import UIKit

// GlobalActors - ios academy


DispatchQueue.main.async {
    /// メインスレッドで非同期に実行されるブロック
}

/// MainActor属性を持つクラス
@MainActor
final class Thing {
    /// メインスレッドで非同期に実行されるコードブロック
    func doSomething() {
        /// メインスレッドで実行される非同期コード
    }
}

/// グローバルアクター
@globalActor
actor Actor {
    static var shared = Actor()
}

/// 画像をプレゼンテーションするためのクラス
class ImagePresenter {
    
    /// 画像の配列
    @MainActor var images: [UIImage] = []
    
    /// 画像をフェッチするメソッド
    func fetch() {
        DispatchQueue.main.async {
            /// メインスレッドで非同期に実行されるブロック
        }
    }
    
    /// UIを更新するメソッド
    @MainActor
    func updateUI() {
        /// UIを更新するためのメソッド
    }
}

extension MainActor {

    /// カスタムの非同期実行メソッド
    /// - Parameters:
    ///   - resultType: 戻り値の型
    ///   - body: 実行する非同期ブロック
    /// - Returns: 実行結果の戻り値
    public static func run<T>(
        resultType: T.Type = T.self,
        body: @MainActor @Sendable () throws -> T
    ) async rethrows -> T {
        do {
            /// 非同期ブロックを実行し、結果を返す
            return try await body()
        }
        catch {
            /// エラーが発生した場合の処理
            throw error
        }
    }
}

/// 非同期ブロックの例
Task {
    // MainActor.runを使用してカスタム非同期処理を呼び出す
    await MainActor.run {
        // カスタム非同期処理の内容（コメントアウトされている）
    }
}
