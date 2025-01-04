//
//  TitleView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/31.
//

import SwiftUI

struct TitleView: View {

    // MARK: - プロパティー
    var title: String

    // MARK: - ボディー

    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Spacer()
        }//: HStack
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 15)
    }//: ボディー
}

#Preview {
    TitleView(title: "タイトル")
}
