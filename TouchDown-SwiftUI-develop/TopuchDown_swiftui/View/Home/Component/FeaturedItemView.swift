//
//  FeaturedItemView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/30.
//

import SwiftUI

struct FeaturedItemView: View {

    // MARK: - プロパティー

    let playerData: PlayerData
    // MARK: - ボディー

    var body: some View {
        Image(playerData.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }//: ボディ
}

#Preview {
    FeaturedItemView(playerData: PlayerDataViewModel().getPlayerData(at: 0))
}
