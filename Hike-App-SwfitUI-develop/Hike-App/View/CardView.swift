//
//  CardView.swift
//  Hike-App
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/09.
//

import SwiftUI


struct CardView: View {

    /// テキストのグラデーションに使用する色の配列
    private let textColors: [Color] = [
        .themaGrayMedium,
        .themaGreenLight
    ]

    /// 「More」ボタンのタイトルのグラデーションに使用する色の配列
    private var moreButtonTitleColors: [Color] = [
        .white,
        .themaGrayLight
    ]

    /// 「More」ボタンの背景のグラデーションに使用する色の配列
    private var moreButtonColors: [Color] = [
        .themaGrayLight,
        .themaGrayMedium
    ]

    /// 現在表示されている画像の番号を管理するState変数
    @State private var imageNumber = 1

    /// 画像の番号をランダムに選択するための変数
    @State private var randomNumber = 1

    @State private var isShowSheet: Bool = false

    @available(iOS 16.0, *)
    var body: some View {
        // MARK: - Card Layout

        /// カードのメインコンテンツを包むZStack
        ZStack {
            /// カードの背景を生成するBackGroundView
            BackGroundView()

            // MARK: - Card Contents
            VStack {
                // MARK: - Card Header
                VStack(alignment: .leading) {

                    // MARK: - Card Title & Button

                    /// カードのタイトルとボタンを並べるHStack
                    HStack {

                        /// カードのメインタイトル「Hiking」を表示
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            /// タイトルのテキストにグラデーションを適用
                            .foregroundStyle(
                                textColors.addGradation(
                                    startpoint: .top,
                                    endPoint: .bottom)
                            )

                        Spacer()

                        /// カスタムボタンを表示するButton
                        Button {
                            isShowSheet.toggle()
                        } label: {
                            CustomButton()
                        }

                        .sheet(isPresented: $isShowSheet, content: {
                            SettingView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        })
                    }

                    // MARK: - Card Comment

                    /// カードの下部に表示されるコメント
                    Text("CardViewComment")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.themaGrayMedium)
                }

                // MARK: - Card Image

                /// 画像とカスタムサークルを含むZStack
                ZStack {

                    /// カードの背景に表示されるCustomCircle
                    CustomCircle()

                    /// 番号に基づいて画像を表示
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeInOut, value: imageNumber)
                }

                // MARK: - More Button

                /// 「More」ボタン
                Button {
                    /// 画像をランダムに変更する関数を呼び出す
                    randomImage()
                } label: {
                    Text("More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(moreButtonTitleColors.addGradation())
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x:1 , y:2)
                }
                .padding(.horizontal)
                .padding(.vertical)
                .background(moreButtonColors.addGradation())
                .cornerRadius(40)
            }
            .padding(.horizontal, 30)
        }
        .padding(.vertical, 30)
        .padding(.horizontal, 20)
    }

    /// 現在の画像と異なる新しい画像番号をランダムに選択する関数
    private func randomImage() {
        repeat {
            /// 1から5の間でランダムな数字を選択
            randomNumber = Int.random(in: 1...5)

            /// 現在の画像番号と異なるものが選択されるまで繰り返す
        } while imageNumber == randomNumber

        /// 新しい画像番号を更新
        imageNumber = randomNumber
    }
}


#Preview {
    CardView()
}
