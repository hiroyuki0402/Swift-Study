//
//  HeaderTabView.swift
//  TwitterCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2024/06/07.
//

import SwiftUI

struct HeaderTabView: View {
    // MARK: - プロパティー
    
    @Binding var selectedTab: HeaderTabViewTabItem
    
    /// タブの幅
    @State private var tabWidths: [HeaderTabViewTabItem: CGFloat] = [:]
    
    // MARK: - ボディー
    var body: some View {
        HStack {
            ForEach(HeaderTabViewTabItem.allCases) { item in
                VStack {
                    HStack {
                        /// ジャンルのタイトル
                        Text(item.getTitle())
                            .foregroundStyle(.black)
                            .padding(.horizontal, 50)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .modifier(WidthSetterModifier(width: Binding(
                                get: { self.tabWidths[item, default: 0] },
                                set: { self.tabWidths[item] = $0 }
                            ), margin: 70))
                    }
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
                }
                .padding(.leading, 10)
                .padding(.top, 10)
                .onTapGesture {
                    /// ジャンル押下時
                    withAnimation(nil) {
                        selectedTab = item
                    }
                }
            }
        }
    }
}

enum HeaderTabViewTabItem: Int, CaseIterable, Identifiable {
    /// おすすめ
    case recommend
    
    /// フォロー中
    case follow
    
    /// 識別用ID
    var id: Int {
        return self.rawValue
    }
    
    /// タブのタイトル
    /// - Returns: 条件に一致したタブのタイトル
    func getTitle() -> String {
        switch self {
        case .recommend:
            return "おすすめ"
            
        case .follow:
            return "フォロー中"
        }
    }
}

#Preview {
    HeaderTabView(selectedTab: .constant(.follow))
}
