//
//  TopicsTabItemView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/03.
//

import SwiftUI

enum TopicsTabItem: Int, CaseIterable, Identifiable {
    case pickup
    case otoku
    case campaign
    case reservation
    case service
    case notificatrion
    case recruitment

    var id: Int {
        return self.rawValue
    }

    func getTitle() -> String {
        switch self {
        case .pickup:
            return "ピックアップ"
        case .otoku:
            return "お得情報"
        case .campaign:
            return "キャンペーン"
        case .reservation:
            return "予約"
        case .service:
            return "サービス"
        case .notificatrion:
            return "ローソンからのお知らせ"
        case .recruitment:
            return "募集"
        }
    }
}

struct TopicsTabItemView: View {
    // MARK: - プロパティー
    @State private var selectedTab: TopicsTabItem = .pickup
    /// スレッドタブの幅
    @State private var tabWidths: [TopicsTabItem: CGFloat] = [:]
    var showmoreButtonBackGroundColor = #colorLiteral(red: 0.7870665356, green: 0.8987134874, blue: 0.9764705896, alpha: 1)
    var showmoreButtonBorderColor = #colorLiteral(red: 0.3331833587, green: 0.5659576486, blue: 0.9764705896, alpha: 1)


    // MARK: - ボディー

    var body: some View {
        VStack {
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    genreButton
                }

            }
        }
    }//: ボディー
}

private extension TopicsTabItemView {
    /// ジャンル
    private var genreButton: some View {
        VStack(spacing: 1) {
            HStack {
                ForEach(TopicsTabItem.allCases) { item in
                    VStack {
                        Button {
                            selectedTab = item
                        } label: {
                            Text(item.getTitle())
                                .foregroundStyle(.black)
                                .fontWeight(.light)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 2)
                                .modifier(WidthSetterModifier(width: Binding(
                                    get: { self.tabWidths[item, default: 0] },
                                    set: { self.tabWidths[item] = $0 }
                                )))
                        }
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
                }
            }
            Divider()
        }
    }
}


#Preview {
    TopicsTabItemView()
}
