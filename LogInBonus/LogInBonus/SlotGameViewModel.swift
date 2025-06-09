import SwiftUI
import Combine

class SlotViewModel: ObservableObject {
    // MARK: - Published Properties (UIに反映させたい状態)
    @Published var ticketCount: Int = 10 // チケット枚数（初期値10）
    @Published var canSpin: Bool = true // スピンボタンの有効/無効
    @Published var showResult: Bool = false // 結果表示フラグ
    @Published var lastResult: [String] = ["?", "?", "?"] // 最新の結果シンボル
    @Published var didWin: Bool = false // 最新の結果が当たりか
    @Published var showNextButton: Bool = false // 「次へ」ボタン表示フラグ
    @Published var spinningReels: [Bool] = [false, false, false] // 各リールの回転状態

    // MARK: - Properties
    let scene: SlotGameScene // SpriteKitシーンのインスタンス

    // MARK: - Initializer
    init() {
        // シーンを初期化（ViewModel生成時に一度だけ）
        self.scene = SlotGameScene(size: CGSize(width: 360, height: 300)) // 初期サイズ指定
        self.scene.scaleMode = .aspectFill // アスペクト比を保ちつつ埋める
        self.scene.viewModel = self // シーンにViewModelへの参照を渡す
    }

    // MARK: - Public Methods (Viewから呼ばれる)

    /// スピン開始
    func spin() {
        guard canSpin, ticketCount > 0 else { return } // スピン可能か、チケットがあるかチェック

        // 状態リセット
        showResult = false
        showNextButton = false
        didWin = false
        lastResult = ["?", "?", "?"]
        spinningReels = [true, true, true] // 全リール回転開始
        canSpin = false // スピン中は押せないように

        // チケット消費
        ticketCount -= 1

        // シーンにスピン開始を指示
        scene.spinAllReels()
    }

    /// 指定したリールを停止
    /// - Parameter index: 停止するリールのインデックス (0, 1, 2)
    func stopReel(at index: Int) {
        // 指定リールが回転中ならシーンに停止を指示
        if spinningReels[index] {
            scene.stopReel(at: index)
        }
    }

    /// 全リールをリセット（デバッグ用など）
    func resetGame() {
        scene.resetReels()
        canSpin = true
        showResult = false
        showNextButton = false
        didWin = false
        lastResult = ["?", "?", "?"]
        spinningReels = [false, false, false]
        // ticketCount = 10 // 必要に応じてチケットもリセット
    }

    // MARK: - Callback Handling (Sceneから呼ばれる)

    /// リール停止完了通知
    /// - Parameter index: 停止したリールのインデックス
    func reelDidStop(at index: Int) {
        // メインスレッドでUI関連の状態を更新
        DispatchQueue.main.async {
            self.spinningReels[index] = false
        }
    }

    /// 全リール停止後の結果通知
    /// - Parameters:
    ///   - symbols: 停止したシンボルの配列
    ///   - isWin: 当たりかどうか
    func finalResult(symbols: [String], isWin: Bool) {
        // メインスレッドでUI関連の状態を更新
        DispatchQueue.main.async {
            self.lastResult = symbols
            self.didWin = isWin
            self.showResult = true
            self.canSpin = self.ticketCount > 0 // チケットがあれば再度スピン可能に
            self.showNextButton = isWin // 当たりの場合のみ「次へ」を表示

            // デバッグログ
            print("ViewModel Result: \(symbols), Win: \(isWin), Tickets: \(self.ticketCount)")
        }
    }
}
