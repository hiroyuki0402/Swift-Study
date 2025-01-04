//
//  StatusTabView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/30.
//

import SwiftUI

struct StatusTabView: View {
    // MARK: - プロパティー
    @Binding var selectedTab: TabItem

    /// タブの幅
    @State private var tabWidths: [TabItem: CGFloat] = [:]

    // MARK: - ボディー

    var body: some View {
        HStack {
            ForEach(TabItem.allCases) { item in
                VStack {
                    /// ジャンルのタイトル
                    Text(item.getTitle())
                        .foregroundStyle(.black)
                        .padding(.horizontal, 5)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .modifier(WidthSetterModifier(width: Binding(
                            get: { self.tabWidths[item, default: 0] },
                            set: { self.tabWidths[item] = $0 }
                        )))

                    /// タブ判定
                    if selectedTab == item {
                        Rectangle()
                            .foregroundStyle(Color.blue)
                            .frame(width: self.tabWidths[item, default: 0], height: 2)

                    } else {
                        Rectangle()
                            .foregroundStyle(Color.clear)
                            .frame(width: self.tabWidths[item, default: 0], height: 2)
                    }

                }//: VStack
                .padding(.leading, 10)
                .padding(.top, 10)
                .onTapGesture {
                    /// ジャンル押下時
                    withAnimation(nil) {
                        selectedTab = item
                    }
                }
            }//: ForEach

            Spacer()

        }//: HStack
    }//: ボディー
}

// MARK: - タブのアイテム

enum TabItem: Int, CaseIterable, Identifiable {
    /// すぐに使えるクーポン
    case now

    /// 引換券
    case trial

    /// 識別用ID
    var id: Int {
        return self.rawValue
    }

    /// タブのタイトル
    /// - Returns: 条件に一致したタブのタイトル
    func getTitle() -> String {
        switch self {
        case .now:
            return "すぐに使えるクーポン"

        case .trial:
            return "お試し引き換券"
        }
    }
}

#Preview {
    StatusTabView(selectedTab: .constant(.now))
}
