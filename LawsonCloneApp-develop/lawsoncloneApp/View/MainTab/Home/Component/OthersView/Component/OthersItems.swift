//
//  OthersItems.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/26.
//

import SwiftUI

struct OthersItems: View {
    // MARK: - プロパティー

    var othersItem: OthersItem

    // MARK: - ボディー

    var body: some View {
        VStack {
            /// アイコン
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 50, height: 50)

                Image(systemName: othersItem.imageName)
                    .font(.title)
                    .foregroundColor(.navigationBar)
            }//: ZStack

            /// タイトル
            Text(othersItem.title)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }//: VStack
    }//: ボディー
}

#Preview {
    OthersItems(othersItem: TestData.shared.othersItems[0])
}
