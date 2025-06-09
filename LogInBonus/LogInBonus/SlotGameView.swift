import SpriteKit
import GameplayKit // 乱数生成のため

class SlotGameScene: SKScene {

    // MARK: - Properties
    private let symbols = (1...12).map { "\($0)" } // 数字1〜12
    private let symbolHeight: CGFloat = 60.0 // シンボルの高さ（要件通り）
    private let visibleRows: Int = 5 // 表示行数 (中央3 + 上下1)
    private let bufferRows: Int = 3 // 上下に追加で読み込んでおく行数（スクロール用、少し多めに）
    private let reelCount: Int = 3 // リール数
    private let reelSpacing: CGFloat = 120 // リール間のスペース

    private var reels: [SKNode] = [] // 各リール(SKNode)を保持
    private var spinningActions: [SKAction?] = [nil, nil, nil] // 各リールの回転アクション

    // 状態管理と結果通知はViewModel経由で行う
    weak var viewModel: SlotViewModel?

    private var randomSource = GKRandomSource.sharedRandom() // 乱数生成器

    // MARK: - Scene Lifecycle
    override func didMove(to view: SKView) {
        backgroundColor = .clear
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }

    override func sceneDidLoad() {
        super.sceneDidLoad()
        print("Scene Size on didLoad: \(size)")
        if reels.isEmpty {
             createReels()
             resetReels()
        }
    }

    // MARK: - Reel Creation
    private func createReels() {
        reels.removeAll()
        for i in 0..<reelCount {
            let reelNode = SKNode()
            reelNode.position = CGPoint(x: CGFloat(i - 1) * reelSpacing, y: 0)
            addChild(reelNode)
            reels.append(reelNode)
        }
         print("Reels created. Count: \(reels.count)")
    }

    private func createLabelNode(symbol: String, yPosition: CGFloat) -> SKLabelNode {
        let label = SKLabelNode(text: symbol)
        label.fontSize = 48
        label.fontColor = .white
        label.fontName = "Helvetica-Bold"
        label.verticalAlignmentMode = .center
        label.horizontalAlignmentMode = .center
        label.position = CGPoint(x: 0, y: yPosition)
        label.name = "symbol_\(symbol)"
        return label
    }

    // MARK: - Game Logic: Spin
    func spinAllReels() {
         guard size != .zero, !reels.isEmpty else {
             print("Error: Scene size or Reels not ready. Cannot spin.")
             viewModel?.canSpin = true
             return
         }
        print("Spin All Reels called.")
        for i in 0..<reels.count {
            startSpinning(reelIndex: i)
        }
    }

    private func startSpinning(reelIndex: Int) {
        guard let reel = reels[safe: reelIndex] else { return }
        reel.removeAllActions()

        let currentCenterIndex = findClosestSymbolIndex(in: reel, to: 0) ?? randomSource.nextInt(upperBound: symbols.count)
        setupReelLabels(reelIndex: reelIndex, centerSymbolIndex: currentCenterIndex)
        print("Start Spinning Reel \(reelIndex). Initial Labels: \(reel.children.count)")

        let moveDown = SKAction.moveBy(x: 0, y: -symbolHeight, duration: 0.03)
        moveDown.timingMode = .linear
        let updateAction = SKAction.run { [weak self] in self?.updateReelLabels(reelIndex: reelIndex) }
        let sequence = SKAction.sequence([moveDown, updateAction])
        let spinAction = SKAction.repeatForever(sequence)

        reel.run(spinAction, withKey: "spinning")
        spinningActions[reelIndex] = spinAction
    }

    private func updateReelLabels(reelIndex: Int) {
        guard let reel = reels[safe: reelIndex], size != .zero else { return }
        let labels = reel.children.compactMap { $0 as? SKLabelNode }
        if labels.isEmpty { return }

        let topBoundary = size.height / 2 + symbolHeight * CGFloat(bufferRows)
        let bottomBoundary = -size.height / 2 - symbolHeight * CGFloat(bufferRows)
        var labelsToAdd: [SKLabelNode] = []
        var labelsToRemove: [SKLabelNode] = []
        let yPositions = Set(labels.map { $0.position.y })
        guard let currentMaxY = yPositions.max(), let currentMinY = yPositions.min() else { return }

        for label in labels {
            let labelPositionInScene = convert(label.position, from: reel)
            if labelPositionInScene.y < bottomBoundary {
                labelsToRemove.append(label)
                let newY = currentMaxY + symbolHeight
                if !yPositions.contains(newY) {
                     if let topSymbolIndex = symbols.firstIndex(of: labels.first(where: {$0.position.y == currentMaxY})?.text ?? "") {
                          let newSymbolIndex = (topSymbolIndex - 1 + symbols.count) % symbols.count
                          labelsToAdd.append(createLabelNode(symbol: symbols[newSymbolIndex], yPosition: newY))
                     }
                }
            } else if labelPositionInScene.y > topBoundary {
                labelsToRemove.append(label)
                let newY = currentMinY - symbolHeight
                 if !yPositions.contains(newY) {
                     if let bottomSymbolIndex = symbols.firstIndex(of: labels.first(where: {$0.position.y == currentMinY})?.text ?? "") {
                          let newSymbolIndex = (bottomSymbolIndex + 1) % symbols.count
                          labelsToAdd.append(createLabelNode(symbol: symbols[newSymbolIndex], yPosition: newY))
                     }
                 }
            }
        }
        if !labelsToRemove.isEmpty { reel.removeChildren(in: labelsToRemove) }
        if !labelsToAdd.isEmpty { labelsToAdd.forEach { reel.addChild($0) } }
    }

    // MARK: - Game Logic: Stop
    /// 指定リールを停止 (moveTo を使う方式に修正)
    /// 指定リールを停止 (少し行き過ぎて微調整する方式に修正)
        func stopReel(at index: Int) {
            guard index < reels.count, spinningActions[safe: index] != nil else { return }
            guard let reel = reels[safe: index] else { return }
            print("StopReel called for index: \(index)")
            reel.removeAction(forKey: "spinning")
            spinningActions[index] = nil

            let targetSymbolIndex = randomSource.nextInt(upperBound: symbols.count)
            let targetSymbol = symbols[targetSymbolIndex]
            print("Reel \(index) Target Symbol: \(targetSymbol)")

            guard let currentClosestLabel = findClosestLabel(in: reel, to: 0) else {
                 print("Error: No closest label found on reel \(index) to stop.")
                 setupReelLabels(reelIndex: index, centerSymbolIndex: targetSymbolIndex) // 強制セットアップ
                 // 停止処理は継続せず、エラー状態として通知するか、再度スピン可能にするなど検討
                 spinningActions[index] = nil // 停止状態にはする
                 viewModel?.reelDidStop(at: index)
                 checkAllResult() // 他のリールが止まっていれば結果判定へ
                return
            }

            // 目標シンボルがリール内で最終的に Y=0 に来てほしい
            // そのためのリール自体の最終目標Y座標 (finalTargetReelY) を計算
            let closestSymbolIndex = symbols.firstIndex(of: currentClosestLabel.text ?? "") ?? 0
            var symbolDiff = targetSymbolIndex - closestSymbolIndex
            if symbolDiff > symbols.count / 2 { symbolDiff -= symbols.count }
            else if symbolDiff < -symbols.count / 2 { symbolDiff += symbols.count }
            let targetSymbolCurrentRelativeY = currentClosestLabel.position.y - CGFloat(symbolDiff) * symbolHeight
            let finalTargetReelY = -targetSymbolCurrentRelativeY // 本来止まるべきリールのY座標

            // 1. 少し上まで移動するアニメーション
            let overshootDistance = symbolHeight // 1シンボル分上にずらす
            let initialMoveTargetY = finalTargetReelY + overshootDistance // 少し上を目標に移動
            let initialMoveDuration = 0.35 // 少し時間をかけて移動

            print("Reel \(index) Initial Move Target Y: \(initialMoveTargetY)")

            let initialMoveAction = SKAction.moveTo(y: initialMoveTargetY, duration: initialMoveDuration)
            initialMoveAction.timingMode = .easeOut

            reel.run(initialMoveAction) { [weak self] in
                guard let self = self else { return }
                print("Reel \(index) initial move completed. Reel Y: \(reel.position.y)")

                // 2. アニメーション完了直後にラベルを最終形に即座にセットアップ
                //    (削除処理は無効化されている前提)
                self.setupReelLabels(reelIndex: index, centerSymbolIndex: targetSymbolIndex)
                print("Labels setup completed. Final Label count: \(reel.children.count)")

                // 3. 本来の目標Y座標 (finalTargetReelY) まで微調整アニメーション
                let finalAdjustDuration = 0.1 // ごく短い時間で調整
                let finalMoveAction = SKAction.moveTo(y: finalTargetReelY, duration: finalAdjustDuration)
                finalMoveAction.timingMode = .easeOut // スッと止まる感じ

                reel.run(finalMoveAction) { [weak self] in
                     guard let self = self else { return }
                     print("Reel \(index) final adjustment completed. Reel Y: \(reel.position.y)")
                     // 最終状態のデバッグログ出力
//                     self.print(FinalDebugInfo(reelIndex: index, reel: reel)
                     // ViewModel通知と結果チェック
                     self.viewModel?.reelDidStop(at: index)
                     self.checkAllResult()
                }
            }
        }

    private func findClosestLabel(in reel: SKNode, to y: CGFloat) -> SKLabelNode? {
        let labels = reel.children.compactMap { $0 as? SKLabelNode }
        return labels.min(by: { abs($0.position.y - y) < abs($1.position.y - y) })
    }

    private func findClosestSymbolIndex(in reel: SKNode, to y: CGFloat) -> Int? {
        guard let label = findClosestLabel(in: reel, to: y), let text = label.text else { return nil }
        return symbols.firstIndex(of: text)
    }

    /// グリッドにスナップさせる (停止後の最終位置調整とラベル整理)
    /// (リール位置補正は行わない前提)
    private func snapToGrid(reelIndex: Int, targetSymbol: String) {
        guard let reel = reels[safe: reelIndex] else { return }
        guard let targetSymbolIndex = symbols.firstIndex(of: targetSymbol) else { return }
        print("SnapToGrid[Reel \(reelIndex)] Started. Target: \(targetSymbol). Reel Y before snap: \(reel.position.y)")

        // リール位置の微調整は行わない

        // 表示に必要なラベルを正しいグリッド位置に強制的に配置・整理する
        setupReelLabels(reelIndex: reelIndex, centerSymbolIndex: targetSymbolIndex)

        print("SnapToGrid[Reel \(reelIndex)] Completed. Reel Y after snap: \(reel.position.y). Final Labels: \(reel.children.count)")

        // --- デバッグコード ---
        print("--- DEBUG: snapToGrid Final Check [Reel \(reelIndex)] ---")
        if let finalCenterLabel = self.findClosestLabel(in: reel, to: 0) {
            let scenePos = self.convert(finalCenterLabel.position, from: reel)
            print(" - Center Label Text: '\(finalCenterLabel.text ?? "N/A")'")
            print(" - Position in Reel (x, y): (\(String(format: "%.1f", finalCenterLabel.position.x)), \(String(format: "%.1f", finalCenterLabel.position.y)))")
            print(" - Position in Scene (x, y): (\(String(format: "%.1f", scenePos.x)), \(String(format: "%.1f", scenePos.y)))") // ★★★ このYが画面内に収まるか？
            print(" - Is Hidden: \(finalCenterLabel.isHidden)")
            print(" - Font Color: \(finalCenterLabel.fontColor)")
            print(" - Alpha: \(finalCenterLabel.alpha)")
            print(" - Z Position: \(finalCenterLabel.zPosition)")
        } else {
            print(" - DEBUG: Final Center Label NOT FOUND!")
        }
        print("----------------------------------------------------")
        // --- デバッグコード終わり ---

        // ViewModelに停止完了を通知
        self.viewModel?.reelDidStop(at: reelIndex)
        // 全リール停止チェック
        self.checkAllResult()
    }

    /// 指定された中央シンボルに基づいて、リールに必要なラベルをセットアップ（整理・生成・削除）する
    /// **[修正箇所]** ラベル位置を強制的に設定する
    /// **[要確認]** ラベル削除が本当にコメントアウトされているか？
    /// 指定された中央シンボルに基づいて、リールに必要なラベルをセットアップ（整理・生成・削除）する
        /// **[修正箇所]** ラベル削除処理を確実に無効化
        private func setupReelLabels(reelIndex: Int, centerSymbolIndex: Int) {
             guard let reel = reels[safe: reelIndex] else { return }
             print("SetupReelLabels[Reel \(reelIndex)] Started. Center Index: \(centerSymbolIndex)")

             let existingLabels = reel.children.compactMap { $0 as? SKLabelNode }
             var updatedOrNewLabels: [SKLabelNode] = []
             var labelsToPotentiallyReuse = existingLabels

             let halfVisible = visibleRows / 2
             let totalHalfRows = halfVisible + bufferRows
             let rowRange = -totalHalfRows...totalHalfRows

             // print("SetupReelLabels[Reel \(reelIndex)]: Setting up rows \(rowRange)")

             for row in rowRange {
                 let targetY = CGFloat(row) * symbolHeight
                 let symbolIndex = (centerSymbolIndex - row + symbols.count * 10) % symbols.count
                 let symbol = symbols[symbolIndex]

                 var bestMatch: SKLabelNode?
                 var minDistance = symbolHeight * 0.6
                 var bestMatchIndex = -1

                 for (index, label) in labelsToPotentiallyReuse.enumerated() {
                     let distance = abs(label.position.y - targetY)
                     if distance < minDistance {
                         minDistance = distance
                         bestMatch = label
                         bestMatchIndex = index
                     }
                 }

                 if let labelToReuse = bestMatch, bestMatchIndex != -1 {
                      labelToReuse.text = symbol
                      labelToReuse.position = CGPoint(x: 0, y: targetY) // 位置を強制的に設定
                      updatedOrNewLabels.append(labelToReuse)
                      labelsToPotentiallyReuse.remove(at: bestMatchIndex)
                 } else {
                      let newLabel = createLabelNode(symbol: symbol, yPosition: targetY) // 正しいY座標で作成
                      reel.addChild(newLabel)
                      updatedOrNewLabels.append(newLabel)
                 }
             }

             let labelsToRemove = labelsToPotentiallyReuse
             if !labelsToRemove.isEmpty {
                  print("SetupReelLabels[Reel \(reelIndex)]: \(labelsToRemove.count) unused labels found.")
                  // ↓↓↓ 確実に削除を無効化 (if false で囲む) ↓↓↓
                  if false {
                      print("!!! Label Removal Block - Should NOT be executed !!!") // 実行されないはず
                      reel.removeChildren(in: labelsToRemove)
                  } else {
                       print("   (Label removal is disabled)") // 削除が無効であることをログ表示
                  }
             }

             print("SetupReelLabels[Reel \(reelIndex)] Completed. Final Label count: \(reel.children.count)")
        }

    // MARK: - Result Check
    private func checkAllResult() {
        if spinningActions.allSatisfy({ $0 == nil }) {
             print("All reels stopped. Checking result...")
            run(SKAction.wait(forDuration: 0.1)) { [weak self] in
                 guard let self = self else { return }
                 let finalSymbols = self.getFinalSymbols()
                  print("Final Symbols Retrieved: \(finalSymbols)")
                 if finalSymbols.count == self.reelCount && !finalSymbols.contains("?") {
                      let isWin = Set(finalSymbols).count == 1 && finalSymbols[0] != "?"
                      self.viewModel?.finalResult(symbols: finalSymbols, isWin: isWin)
                  } else {
                      print("Error: Could not determine final symbols accurately.")
                      self.viewModel?.finalResult(symbols: Array(repeating: "?", count: self.reelCount), isWin: false)
                  }
            }
        }
    }

    private func getFinalSymbols() -> [String] {
        var resultSymbols: [String] = []
        for i in 0..<reels.count {
            guard let reel = reels[safe: i] else { resultSymbols.append("?"); continue }
            // Y=0 に最も近いラベルを探す
            if let centerLabel = findClosestLabel(in: reel, to: 0) {
                 // Y座標が十分に0に近いかチェック
                 if abs(centerLabel.position.y) < symbolHeight * 0.1 {
                     resultSymbols.append(centerLabel.text ?? "?")
                 } else {
                     print("getFinalSymbols[Reel \(i)]: Center label Y (\(centerLabel.position.y)) too far from 0.")
                     resultSymbols.append("?")
                 }
            } else {
                print("getFinalSymbols[Reel \(i)]: Center label not found.")
                resultSymbols.append("?")
            }
        }
        return resultSymbols
    }

    // MARK: - Reset
    func resetReels() {
         print("Reset Reels called.")
         guard !reels.isEmpty else { print("Reels not ready for reset."); return }
         let centerSymbolIndex = 0
        for i in 0..<reels.count {
            if let reel = reels[safe: i] {
                reel.removeAllActions()
                reel.position.y = 0
                reel.removeAllChildren()
                setupReelLabels(reelIndex: i, centerSymbolIndex: centerSymbolIndex)
            }
            spinningActions[i] = nil
        }
          viewModel?.lastResult = Array(repeating: symbols[centerSymbolIndex], count: reelCount)
          viewModel?.didWin = false
          viewModel?.showResult = false
          viewModel?.showNextButton = false
    }
}

// Helper extension for safe array access
extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
import SwiftUI
import SpriteKit

struct SlotGameView: View {
    // ViewModelをStateObjectとして保持（Viewのライフサイクルと連動）
    @StateObject private var viewModel = SlotViewModel()

    var body: some View {
        VStack(spacing: 20) { // 間隔調整
            Text("Tickets: \(viewModel.ticketCount)")
                .font(.title2)
                .padding(.top)

            // スロット表示エリア
            ZStack {
                SpriteView(scene: viewModel.scene) // ViewModelが保持するシーンを使用
                    .frame(width: 360, height: 300) // 5行 x 60pt
                    // .border(Color.gray) // デバッグ用に境界線表示
                    .mask( // マスクで上下をフェード
                        VStack(spacing: 0) {
                            // 上部フェードエリア (1行分)
                            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), .black]), startPoint: .top, endPoint: .bottom)
                                .frame(height: symbolHeight) // 60pt
                            // 中央完全表示エリア (3行分)
                            Rectangle().fill(Color.black)
                                .frame(height: symbolHeight * 3) // 180pt
                            // 下部フェードエリア (1行分)
                            LinearGradient(gradient: Gradient(colors: [.black, Color.black.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                                .frame(height: symbolHeight) // 60pt
                        }
                    )
                    .overlay( // 結果表示 (オプション)
                        Group {
                            if viewModel.showResult {
                                VStack {
                                    Text(viewModel.didWin ? "🎉当たり！🎉" : "残念！")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(viewModel.didWin ? .yellow : .white)
                                    Text("結果: [\(viewModel.lastResult.joined(separator: ", "))]")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .background(Color.black.opacity(0.7))
                                .cornerRadius(15)
                                .transition(.opacity.animation(.easeInOut)) // フェードイン/アウト
                            }
                        }
                    )
            }

            // スピンボタン / チケット不足表示
            if viewModel.ticketCount > 0 {
                Button {
                    viewModel.spin()
                } label: {
                    Text("スピン！")
                        .font(.title)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(viewModel.canSpin ? Color.green : Color.gray) // 状態に応じて色変更
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(!viewModel.canSpin) // スピン不可なら無効化
            } else {
                Text("チケットがありません")
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }


            // ストップボタン
            HStack(spacing: 30) { // 間隔調整
                ForEach(0..<3) { index in
                    Button {
                        viewModel.stopReel(at: index)
                    } label: {
                        Text("Stop \(index + 1)")
                            .padding(10)
                            .background(viewModel.spinningReels[safe: index] == true ? Color.red : Color.gray) // 回転中のみ赤
                            .foregroundColor(.white)
                            .clipShape(Circle()) // 円形
                    }
                    .disabled(!(viewModel.spinningReels[safe: index] == true)) // 回転中でなければ無効
                }
            }
            .padding(.horizontal)


            // 次へボタン / リセットボタン
             HStack {
                 if viewModel.showNextButton {
                     Button("次へ") {
                         // 次の画面への遷移処理など
                         print("「次へ」ボタンが押されました！")
                         viewModel.showNextButton = false // 押されたら非表示に
                     }
                     .padding()
                     .background(Color.blue)
                     .foregroundColor(.white)
                     .cornerRadius(10)
                     .transition(.scale.animation(.easeOut)) // 表示アニメーション
                 }

                 // デバッグ用にリセットボタンを残す
                 Button("リセット") {
                     viewModel.resetGame()
                 }
                 .padding()
                 .background(Color.orange)
                 .foregroundColor(.white)
                 .cornerRadius(10)
             }


            Spacer() // 上に詰める
        }
        .padding() // 全体にパディング
        .background(Color(white: 0.1).ignoresSafeArea()) // 背景色を少し明るく
        .onAppear {
             // Viewが表示されたときにシーンのサイズを確定させる（より安全）
             viewModel.scene.size = CGSize(width: 360, height: symbolHeight * 5)
        }
    }

    // シンボル高さ（マスク計算用にView内でも定義）
    private var symbolHeight: CGFloat = 60.0
}

#Preview {
    SlotGameView()
}
