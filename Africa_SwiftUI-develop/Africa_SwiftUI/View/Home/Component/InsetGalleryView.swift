//
//  InsetGalleryView.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/25.
//

import SwiftUI

struct InsetGalleryView: View {
    // MARK: - プロパティー
    
    /// 動物に関連するギャラリーデータ
    var animalData: AnimalsData

    // MARK: - ボディ

    var body: some View {
        /// 水平方向のスクロールビューを使用して、画像のギャラリーを表示
        ScrollView(.horizontal, showsIndicators: false) {

            /// イメージを水平方向に配置
            HStack(alignment: .center, spacing: 15) {

                /// ギャラリーの各画像を表示
                ForEach(animalData.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(20)
                }
            }//: HStack
        }//: ScrollView
    }//: ボディ
}


#Preview {
    InsetGalleryView(animalData: AnimalsViewModel().getAnimalData(at: 0))
}
