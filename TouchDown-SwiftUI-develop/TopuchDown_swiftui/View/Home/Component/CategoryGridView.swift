//
//  CategoryGridView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/31.
//

import SwiftUI

struct CategoryGridView: View {

    // MARK: - プロパティー


    // MARK: - ボディー

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: CategoryViewModel().gridLayout().gridLayouts,
                alignment: .center,
                spacing: CategoryViewModel().gridLayout().rowSpacing,
                pinnedViews: [],
                content: {
                    Section(
                        header: SectionView(rotateClockwise: false),
                        footer: SectionView(rotateClockwise: true)) {
                        ForEach(CategoryViewModel().categoryDatas) { item in
                            CategoryItemView(categoryData: item)
                        }//: LazyHGrid
                    }})//: Section
            .frame(height: 140)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }//: ScrollView
    }//: ボディー
}

#Preview {
    CategoryGridView()
}
