//
//  BannerItem.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/25.
//

import SwiftUI

struct BannerView: View {
    // MARK: - プロパティー

    // MARK: - ボディー
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(TestData.shared.bannerItems, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(5)
                        .frame(height: 80)
                }

            }//: HStack

        }//: ScrollView

    }//: ボディー
}

#Preview {
    BannerView()
}
