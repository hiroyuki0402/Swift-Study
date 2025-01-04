//
//  TopicsItemView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/03.
//

import SwiftUI

struct TopicsItemView: View {
    // MARK: - プロパティー
    var image: String
    
    // MARK: - ボディー

    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(maxWidth: 200)
                .frame(height: 150)

            Text("毎週チャレンジ!抽選で無料券が当たる")
                .foregroundStyle(Color(uiColor: .darkGray))
                .padding(.top, 6)
        }//: VStack
        .frame(maxWidth: 200)

    }//: ボディー
}

#Preview {
    TopicsItemView(image: "reservation3")
}
