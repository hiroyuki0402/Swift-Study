//
//  CouponItem.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/25.
//

import SwiftUI

struct CouponItem: View {
    // MARK: - プロパティー
    @StateObject var couponViewModel = CouponViewModel()

    var itemType: ItemType
    // MARK: - ボディー

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(couponViewModel.getCoupons(item: itemType)) { item in
                        HStack {
                            CouponScrollViewItem(couponData: item, itemType: itemType)
                                .shadow(radius: 2)
                                .padding(.trailing, 20)
                        }
                        .padding(.vertical, 4)
                    }//: ループ

                }//: HStack

            }//: ScrollView

        }//: VStack

    }//: ボディー
}

#Preview {
    CouponItem(itemType: .coupon)
        .background(Color.gray)
}
