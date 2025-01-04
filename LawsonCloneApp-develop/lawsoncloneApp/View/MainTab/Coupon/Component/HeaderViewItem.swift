//
//  HeaderViewItem.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/29.
//

import SwiftUI

struct HeaderViewItem: View {
    // MARK: - プロパティー
    @Binding var couponGenre: GenreItem

    @Binding var selectedTab: TabItem

    /// ボタンバックグラウンドカラー
    var showmoreButtonBackGroundColor = #colorLiteral(red: 0.7870665356, green: 0.8987134874, blue: 0.9764705896, alpha: 1)

    /// ボーダーカラー
    var showmoreButtonBorderColor = #colorLiteral(red: 0.3331833587, green: 0.5659576486, blue: 0.9764705896, alpha: 1)

    // MARK: - ボディー
    var body: some View {
        VStack {
            /// ヘッダータブ
            StatusTabView(selectedTab: $selectedTab)
                .padding(.bottom, 10)

            if selectedTab == .now {
                HStack {
                /// 全て
                shoreMoreButton

                /// ジャンル
                ScrollView(.horizontal, showsIndicators: false) {
                    genreButton
                        .padding(.trailing, 10)

                }//: ScrollView

            }//: HStack
                .padding(.leading, 10)
        }

        }//: VStack
    }//: ボディー
}

private extension HeaderViewItem {
    /// すべて見るボタン
    private var shoreMoreButton: some View {
        HStack {
            let borderColor = couponGenre == .all ? Color(showmoreButtonBorderColor): .gray
            let backGroundColor = couponGenre == .all ? Color(showmoreButtonBackGroundColor): .white
            let fontColor: Color = couponGenre == .all ? .blue: Color(uiColor: .darkGray)

            Button {
                couponGenre = .all
            } label: {
                Text("すべて")
                    .frame(width: 60)
                    .foregroundStyle(fontColor)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 4)
                    .background(
                        Capsule()
                            .fill(backGroundColor)
                            .stroke(borderColor, lineWidth: 2))
                    .clipShape(.capsule)
            }

            Divider()
                .frame(width: 2, height: 20)
                .background(Color.gray)
        }
    }

    /// ジャンル
    private var genreButton: some View {
        HStack {
            ForEach(GenreItem.allCases.suffix(from: 1), id: \.self) { item in
                let borderColor = couponGenre == item ? Color(showmoreButtonBorderColor): .gray
                let backGroundColor = couponGenre == item ? Color(showmoreButtonBackGroundColor): .white
                let fontColor: Color = couponGenre == item ? .blue: Color(uiColor: .darkGray)
                Button {
                    couponGenre = item
                    print(item)
                    print(couponGenre)
                } label: {
                    Text(item.title())
                        .foregroundStyle(fontColor)
                        .fontWeight(.light)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(         
                            Capsule()
                                .fill(backGroundColor)
                                .stroke(borderColor, lineWidth: 2))
                        .clipShape(.capsule)
                }
            }
        }

    }
}

// MARK: - ジャンルアイテム

enum GenreItem: Int, CaseIterable {
    case `all`
    case pan
    case bento
    case chukaman
    case desert
    case men
    case others
    case currentUser
    case ls100

    /// ジャンルの名前
    /// - Returns: 条件に一致したジャンルの名前
    func title() -> String {
        switch self {
        case .all:
            return "すべて"
        case .pan:
            return "パン"
        case .bento:
            return "弁当"
        case .chukaman:
            return "中華まん"
        case .desert:
            return "デザート"
        case .men:
            return "麺類"
        case .others:
            return "その他"
        case .currentUser:
            return "会員限定"
        case .ls100:
            return "LS100"
        }
    }
}

#Preview {
    HeaderViewItem(couponGenre: .constant(.all), selectedTab: .constant(.now))
        .background(Color(.systemBackground))
}
