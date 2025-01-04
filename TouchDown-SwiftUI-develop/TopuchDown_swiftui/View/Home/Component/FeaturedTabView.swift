//
//  FeaturedTabView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/30.
//

import SwiftUI

struct FeaturedTabView: View {

    // MARK: - プロパティー

    // MARK: - ボディー

    var body: some View {
        TabView {
            ForEach(PlayerDataViewModel().playerDatas) { data in
                FeaturedItemView(playerData: data)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
            }
        }//: TabView
        .tabViewStyle(.page(indexDisplayMode: .always))
    }//: ボディー
}

#Preview {
    FeaturedTabView()
}
