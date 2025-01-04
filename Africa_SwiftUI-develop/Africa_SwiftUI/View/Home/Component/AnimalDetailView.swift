//
//  AnimalDetailView.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/25.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: - プロパティー

    /// 動物の詳細情報を表示するためのデータ
    var animalData: AnimalsData

    // MARK: - Body
    var body: some View {
        // 垂直方向のスクロールビューで内容を表示
        ScrollView(.vertical, showsIndicators: true) {
            // 各項目を垂直に配置
            VStack(alignment: .center, spacing: 20) {

                /// 動物のイメージ
                Image(animalData.image)
                    .resizable()
                    .scaledToFit()

                /// 動物の名前を大きなフォントで表示
                Text(animalData.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )

                /// 動物に関するハイライトテキスト
                Text(animalData.headline)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)

                /// 動物のギャラリー表示部分
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "写真の中の自然")

                    InsetGalleryView(animalData: animalData)
                }
                .padding(.horizontal)

                /// 動物に関するセクション
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "知っていましたか？")
                    InsetFactView(animalDatas: animalData)
                }
                .padding(.horizontal)

                /// 動物の詳細な情報や特徴を表示するセクション
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "\(animalData.name)の全て")

                    Text(animalData.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)


                }
                .padding(.horizontal)

                /// 動物の生息地をマップで表示するセクション
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsetMapView()
                }
                .padding(.horizontal)

                /// 動物に関する外部リンクや関連情報のセクション
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "もっと詳しく知る")

                    ExternalWeblinkView(animalData: animalData)

                }
                .padding(.horizontal)

            }//: VSTACK
            .navigationBarTitle("\(animalData.name)について学ぶ", displayMode: .inline)
        }//: ScrollView
    }
}


#Preview {
    NavigationView {
        AnimalDetailView(animalData: AnimalsViewModel().getAnimalData(at: 0))
    }
}
