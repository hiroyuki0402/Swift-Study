import SwiftUI

struct MotionAnimationView: View {
    // MARK: - プロパティー

    /// ランダムに生成される円の数
    @State private var randomCircle = Int.random(in: 12...16)

    /// アニメーションが実行中かどうかを示すフラグ
    @State private var isAnimating: Bool = false

    // MARK: - ボディー
    var body: some View {

        /// ジオメトリリーダーでビューのサイズを取得
        GeometryReader { geometry in

            /// ZStackで円を重ねる
            ZStack {

                /// 各円に対する処理
                ForEach(0...randomCircle, id: \.self) { item in
                    /// 円を描画
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize())
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .onAppear {
                            /// アニメーション設定
                            withAnimation(
                                /// ばねアニメーション
                                Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                    .speed(randomSpeed())
                                    .repeatForever()
                            ) {
                                isAnimating = true
                            }
                        }
                    }//: ループ
                }//: ZStack
            /// 描画最適化
            .drawingGroup()
            }//: GeometryReader
    }//: ボディ

    // MARK: - メソッド

    /// ランダムな座標を生成
    /// - Parameter max: 最大座標値
    /// - Returns: 生成された座標値
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }

    /// ランダムなサイズを生成
    /// - Returns: 生成されたサイズ
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }

    /// ランダムなスケールを生成
    /// - Returns: 生成されたスケール値
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }

    /// ランダムな速度を生成
    /// - Returns: 生成された速度値
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
}

#Preview {
    MotionAnimationView()
}
