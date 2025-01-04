//
//  ContentView.swift
//  ScrollerView
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/04.
//

import SwiftUI
import CoreData

struct ContentView: View {

    /// 現在の垂直サイズクラスを環境から取得します。
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @State private var rotationAngle: Angle = .zero

    private let itemCount = 10
    private let itemWidth: CGFloat = 100
    private let itemSpacing: CGFloat = 50
    private let circleRadius: CGFloat = 150

    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 0) {
                sampleZero

                sampleOne

                sampleTwo

                sampleThree

                sampleFor

                sampleFive
            }
        }
        .background(.black)
    }//: body

    // MARK: - メソッド

    /// スクロールビュー内の要素のスケール（サイズ）を計算
    /// - Parameter geometry: 要素のGeometryProxy、画面内での位置情報
    /// - Returns: 要素のスケール値。画面の中心に近いほど大きくなる
    private func scaleValue(geometry: GeometryProxy) -> CGFloat {
        let midX = geometry.frame(in: .global).midX
        let viewWidth = UIScreen.main.bounds.width / 2
        let distance = abs(midX - viewWidth)
        let scale = 1 - min(distance / viewWidth, 1)
        return scale
    }

    /// スクロールに応じて要素を回転させるための角度を計算
    /// - Parameter geometry: 要素のGeometryProxy、画面内での位置情報
    /// - Returns: 要素の回転角度,中心からの距離に応じて変化
    private func rotationEffect(for geometry: GeometryProxy) -> Angle {
        let midX = geometry.frame(in: .global).midX
        let viewWidth = UIScreen.main.bounds.width / 5
        let distance = midX - viewWidth
        let maxRotation = 45.0 // 最大45度まで回転
        return .degrees(min(maxRotation, (distance / viewWidth) * maxRotation))
    }

    /// スクロールに応じて要素のX軸方向のオフセットを計算
    /// - Parameter geometry: 要素のGeometryProxy、画面内での位置情報
    /// - Returns: X軸方向のオフセット値で円形軌道を描くために使用される
    private func circleOffsetX(_ geometry: GeometryProxy) -> CGFloat {
        let midX = geometry.frame(in: .global).midX
        let viewCenterX = UIScreen.main.bounds.width / 2
        let angle = (midX - viewCenterX) / (UIScreen.main.bounds.width / 2) * .pi
        return -circleRadius * sin(angle)
    }

    /// スクロールに応じて要素のY軸方向のオフセットを計算
    /// - Parameter geometry: 要素のGeometryProxy、画面内での位置情報を提供します。
    /// - Returns: Y軸方向のオフセット値で円形軌道を描くために使用される
    private func circleOffsetY(_ geometry: GeometryProxy) -> CGFloat {
        let midX = geometry.frame(in: .global).midX
        let viewCenterX = UIScreen.main.bounds.width / 2
        let angle = (midX - viewCenterX) / (UIScreen.main.bounds.width / 2) * .pi
        return circleRadius * (1 - cos(angle))
    }

}

private extension ContentView {

    private var sampleZero: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                /// 水平方向のスクロールビュー
                HStack {
                    /// 10個のCircleViewを生成
                    ForEach(0 ..< 10) {_ in
                        CircleView()
                            .containerRelativeFrame(
                                .horizontal,
                                /// 垂直サイズクラスに応じて項目数を調整
                                count: verticalSizeClass == .regular ? 3: 4,
                                /// 項目間のスペーシング
                                spacing: 16
                            )
                            .scrollTransition { emptyVisualEffect, scrollTransitionPhase in
                                /// スクロール中の視覚的な効果を定義
                                emptyVisualEffect
                                    .opacity(scrollTransitionPhase.isIdentity ? 1.0: 0.0)
                                    .scaleEffect(
                                        x: scrollTransitionPhase.isIdentity ? 1.0: 0.0,
                                        y: scrollTransitionPhase.isIdentity ? 1.0: 0.0
                                    )
                                    .offset(y: scrollTransitionPhase.isIdentity ? 0: 50)
                            }//: scrollTransition
                    }//: ForEach

                }//: HStack
                .frame(height: 300)
                /// スクロール対象のレイアウトを定義
                .scrollTargetLayout()
            }//: ScrollView

            /// スクロールコンテンツのマージンを設定
            .contentMargins(16, for: .scrollContent)
        }
        .frame(height: 300)
    }

    private var sampleOne: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                /// 水平方向のスクロールビュー
                HStack {
                    /// 10個のCircleViewを生成
                    ForEach(0 ..< 10) {_ in
                        CircleView()
                            .containerRelativeFrame(
                                .horizontal,
                                /// 垂直サイズクラスに応じて項目数を調整
                                count: verticalSizeClass == .regular ? 3: 4,
                                /// 項目間のスペーシング
                                spacing: 16
                            )
                            .scrollTransition { emptyVisualEffect, scrollTransitionPhase in
                                /// スクロール中の視覚的な効果を定義
                                emptyVisualEffect
                                    .opacity(scrollTransitionPhase.isIdentity ? 1.0: 0.0)
                                    .scaleEffect(
                                        x: scrollTransitionPhase.isIdentity ? 1.0: 0.0,
                                        y: scrollTransitionPhase.isIdentity ? 1.0: 0.0
                                    )
                                    .offset(y: scrollTransitionPhase.isIdentity ? 0: 50)
                            }//: scrollTransition
                    }//: ForEach

                }//: HStack
                .frame(height: 300)
                /// スクロール対象のレイアウトを定義
                .scrollTargetLayout()
            }//: ScrollView

            /// スクロールコンテンツのマージンを設定
            .contentMargins(10, for: .scrollContent)
        }
        .frame(height: 300)
    }

    private var sampleTwo: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { scrollValue in
                    HStack(spacing: 16) {
                        ForEach(0..<50) { index in
                            GeometryReader { geometry in
                                CircleView()
                                    .scaleEffect(scaleValue(geometry: geometry))
                                    .frame(width: 100, height: 100)
                            }
                            .frame(width: 100, height: 100)
                        }
                    }
                    .padding()
                }
            }
            .frame(height: 300)
        }
        .frame(height: 300)
    }

    private var sampleThree: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<10) { index in
                        GeometryReader { geometry in
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color.red)
                                .rotationEffect(self.rotationEffect(for: geometry))
                                .frame(width: 100, height: 100)
                        }
                        .frame(width: 100, height: 100)
                    }
                }
                .padding()
            }
            .frame(height: 300)
        }
        .frame(height: 300)
    }

    private var sampleFor: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 50) {
                    ForEach(0..<10) { index in
                        GeometryReader { geometry in
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.green)
                                .frame(width: 100, height: 100)
                                .rotation3DEffect(
                                    .degrees(-Double(geometry.frame(in: .global).midX) / 10),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                        }
                        .frame(width: 100, height: 100)
                    }
                }
                .padding(50)
            }
            .frame(height: 300)
        }
        .frame(height: 300)
        .padding()
    }

    private var sampleFive: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: itemSpacing) {
                    ForEach(0 ..< 10) { index in
                        GeometryReader { geometry in
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.blue)
                                .frame(width: itemWidth, height: itemWidth)
                                .offset(x: circleOffsetX(geometry), y: circleOffsetY(geometry))
                                .zIndex(-abs(circleOffsetY(geometry)))
                        }
                        .frame(width: itemWidth, height: 500)
                    }
                }
                .padding(.horizontal, UIScreen.main.bounds.width / 2 - itemWidth / 2)
            }
            .frame(height: 500)
        }
        .frame(height: 500)
    }
}

#Preview {
    ContentView() // プレビュー用のContentViewインスタンスを生成
}
