//
//  BrandGridView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/01.
//

import SwiftUI

struct BrandGridView: View {


    // MARK: - プロパティー

    // MARK: - ボディー

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: CategoryViewModel().gridLayout().gridLayouts,
                spacing: CategoryViewModel().gridLayout().coulumnSpace,
        content: {
            ForEach(BrandViewModel().brandDatas) { itme in
                BrandItemView(brandData: itme)
            }
            })//: LazyHGrid
            .frame(height: 200)
            .padding(15)
        }
    }
}

#Preview {
    BrandGridView()
}

/*

 */


