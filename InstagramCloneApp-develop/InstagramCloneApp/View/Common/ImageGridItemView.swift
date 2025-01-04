//
//  GridItemView.swift
//  InstagramCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/10.
//

import SwiftUI

enum GridType {
    case vGrid, hGrid
}

struct ImageGridItemView: View {
    // MARK: - プロパティー

    var gridType: GridType = .vGrid

    var coulumnSpace: CGFloat = 0

    var rowSpacing: CGFloat = 0

    var count: Int

    var imagese: [String]

    // MARK: - ボディー
    var body: some View {

        if gridType == .vGrid {
            LazyVGrid(columns: gridLayout().gridLayouts,
                      alignment: .center,
                      spacing: gridLayout().coulumnSpace,
                      pinnedViews: []) {
                ForEach(0...4, id: \.self) { image in
                    Image("apple")
                        .resizable()
                        .scaledToFill()
                }
            }
                      .padding(.horizontal, 5)
        }

        if gridType == .hGrid {
            // TODO: -
        }
    }//: body

    func gridLayout() -> (coulumnSpace: CGFloat, rowSpacing: CGFloat, gridLayouts: [GridItem])  {
        let columnSpacing: CGFloat = coulumnSpace
        let rowSpacing: CGFloat = rowSpacing
        var gridLayout: [GridItem] {
            return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: count)
        }
        return (columnSpacing, rowSpacing, gridLayout)
    }

}

#Preview {
    ImageGridItemView(gridType: .vGrid, coulumnSpace: 1, rowSpacing: 1, count: 3, imagese: ["apple", "apple", "apple", "apple"])
}
