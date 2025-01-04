//
//  TrialView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/16.
//

import SwiftUI

struct TrialView: View {
    // MARK: - プロパティー
    var coupondata: CouponData

    // MARK: - ボディー

    var body: some View {
        LazyVStack {
            TrialItemView(coupondata: coupondata)
        }

    }//: body
}

#Preview {
    TrialView(coupondata: TestData.shared.couponData2[0])
}
