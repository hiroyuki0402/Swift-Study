//
//  MotionAnimation.swift
//  Hike-App
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/09.
//

import SwiftUI

struct MotionAnimation: View {
    /// 生成する円の数をランダムに決定する状態変数
    @State private var randomCircle = Int.random(in: 6...12)

    /// アニメーションが動作中かどうかを管理する状態変数
    @State private var isAnimating: Bool = false

    var body: some View {
        ZStack {
            /// 各円を`randomCircle`の数だけ繰り返して表示する
            ForEach(0...randomCircle, id: \.self) { item in
                /// 白い円を生成する
                Circle()
                /// 円の色を白に設定する
                    .foregroundColor(.white)

                /// 円の透明度を0.25に設定する
                    .opacity(0.25)

                /// 円の横幅をランダムに設定する
                    .frame(width: randomSize())

                /// 円の縦幅をランダムに設定する
                    .frame(height: randomSize())

                /// 円の位置をランダムに設定する
                    .position(
                        x: randomCordinate(),
                        y: randomCordinate())

                /// アニメーション中の場合、円のサイズをランダムにスケーリングする
                    .scaleEffect(isAnimating ? randomScale(): 1)

                /// ビューが表示されたときのアクション
                    .onAppear(
                        perform: {
                            /// スプリングアニメーションで円を継続的に動かす
                        withAnimation(
                            /// 補完するスプリングアニメーションを定義
                            .interpolatingSpring(
                                /// スプリングの硬さを示す値。値が大きいほどアニメーションが速く、反発が強くなる
                                stiffness: 0.25,
                                /// スプリングの減衰を示す値。値が大きいほどオーバーシュートやバウンスの影響が少なくなる
                                damping: 0.25)

                            /// アニメーションを無限に繰り返す
                            .repeatForever()

                            /// アニメーションの速度をランダムに設定する
                            .speed(randomSpeed())
                            
                            /// アニメーションの開始をランダムな遅延後にする
                            .delay(randomDelay())) {
                                /// アニメーションを開始する
                                isAnimating = true
                            }
                    })
            }
        }
        /// ZStackのサイズを固定する
        .frame(width: 256, height: 256)
        /// ZStackの形を円にマスクする
        .mask(Circle())
        /// グラフィックスのレンダリングを最適化する
        .drawingGroup()
    }

    /// 0〜256の範囲でランダムな座標を生成する関数
    private func randomCordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }

    /// 4〜80の範囲でランダムなサイズを生成する関数
    private func randomSize() -> CGFloat {
        return CGFloat.random(in: 4...80)
    }

    /// 0.1〜2.0の範囲でランダムなスケール値を生成する関数
    private func randomScale() -> CGFloat {
        return CGFloat.random(in: 0.1...2.0)
    }

    /// 0.05〜1.0の範囲でランダムなスピードを生成する関数
    private func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }

    /// 0〜2の範囲でランダムな遅延時間を生成する関数
    private func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
}

#Preview {
    MotionAnimation()
        .background {
            Circle()
                .fill(.teal)
        }
}
