//
//  AnimalListItemView.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/22.
//

import SwiftUI

struct AnimalListItemView: View {
    // MARK: - プロパティー

    /// 表示する動物のデータを保持するプロパティ。
    var animalsData: AnimalsData

    // MARK: - ボディ
    var body: some View {
        /// 水平方向のスタックで動物のイメージと詳細を表示
        HStack(alignment: .center, spacing: 16) {
            /// 動物のイメージを表示
            Image(animalsData.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                    )

                /// 動物の名前とヘッドラインを垂直スタックで表示
                VStack(alignment: .leading, spacing: 8) {
                    /// 動物の名前を表示
                    Text(animalsData.name)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.accentColor)

                    /// 動物のヘッドラインを表示。2行まで表示され、それ以上は省略される
                    Text(animalsData.headline)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .padding(.trailing, 8)
                }//: VSTACK
            }//: HSTACK
        }//: ボディ
    }


#Preview {
    AnimalListItemView(animalsData: AnimalsViewModel().getAnimalData(at: 0))
}
