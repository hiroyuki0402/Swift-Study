//
//  CoiponView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/25.
//

import SwiftUI

struct CoiponView: View {
    // MARK: - プロパティー
    var itemType: ItemType
    
    // MARK: - ボディー

    var body: some View {
        VStack {
            /// ヘッダー
            SectionHeader(title: itemType.title())

            /// コンテンツ
            CouponItem(itemType: itemType)

        }//: VStack

    }//: ボディー
}

#Preview {
    CoiponView(itemType: .coupon)
}
