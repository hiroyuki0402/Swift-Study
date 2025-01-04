//
//  HeaderView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/29.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - プロパティー
    /// ジャンル選択時の反映
    @Binding var selectedGenre: GenreItem

    @Binding var selectedTab: TabItem

    // MARK: - ボディー
    var body: some View {
        VStack {
            /// ジャンル
            HeaderViewItem(couponGenre: $selectedGenre, selectedTab: $selectedTab)
                .frame(maxWidth: .infinity)
                .padding(.bottom, 10)
            
        }//: VStack
        .background(Color(.systemGray6))
        
    }//: ボディー
}

#Preview {
    HeaderView(selectedGenre: .constant(.all), selectedTab: .constant(.now))
}
