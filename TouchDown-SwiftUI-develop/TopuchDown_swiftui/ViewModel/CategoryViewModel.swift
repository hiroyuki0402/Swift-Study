//
//  CategoryViewModel.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/31.
//

import Foundation
import SwiftUI

class CategoryViewModel: ObservableObject {

    @Published var categoryDatas: CategoryDatas = []

    init() {
        loadData()
    }

    func loadData() {
        let file = "category.json"
        if let decode = Bundle.main.decode(file, type: CategoryDatas.self) {
            categoryDatas = decode
        }
    }

    func getCategoryData(at index: Int) -> CategoryData {
        return categoryDatas[index]
    }

    func gridLayout() -> (coulumnSpace: CGFloat, rowSpacing: CGFloat, gridLayouts: [GridItem])  {
        let columnSpacing: CGFloat = 10
        let rowSpacing: CGFloat = 10
        var gridLayout: [GridItem] {
          return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
        }
        return (columnSpacing, rowSpacing, gridLayout)
    }
}
