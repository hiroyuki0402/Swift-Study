//
//  CategoryImage.swift
//  SwiftUILearning
//
//  Created by SHIRAISHI HIROYUKI on 2023/04/19.
//

import SwiftUI

struct CategoryImage: View {
    var body: some View {
        Image(systemName: "tortoise.fill")
        /// モディファイア
        /// 画像拡大
            .resizable()
        /// 画像の比率維持
            .scaledToFit()
        /// 前側の色
            .foregroundColor(.white)
        /// フレーム
            .frame(width: 50, height: 50)
        /// 余白
            .padding(5)
        /// 背景色
            .background(.black)
        /// 角丸
            .cornerRadius(10)

    }
}

struct CategoryImage_Previews: PreviewProvider {
    static var previews: some View {
        CategoryImage()
    }
}
