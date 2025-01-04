//
//  ContentsHeader.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/25.
//

import SwiftUI

enum ContentsHeaderItem: Int, CaseIterable, Identifiable {
    case christmas
    case newYear


    var id: Int {
        return self.rawValue
    }

    func sectionTitle(for year: Int) -> String {
        switch self {
        case .newYear:
            return "\(year)おせち"
        case .christmas:
            return "\(year)クリスマス"
        }
    }
}

struct ContentsHeaderView: View {
    var item: ContentsHeaderItem
    var year: Int
    var isHide: Bool = false
    var fontSize: CGFloat = 17
    var body: some View {
        HStack(alignment: .top) {
            HStack(alignment: .top) {
                if !isHide {
                    addDivider(color: .navigationBar, width: 1.5, height: 50)
                }

                Text(item.sectionTitle(for: year))
                    .font(.system(size: fontSize))
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
            }

            Spacer()
        }
    }
}

#Preview {
    ContentsHeaderView(item: .christmas, year: 2023)
        .padding()
}
