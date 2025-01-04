//
//  ReservationItem.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/25.
//

import SwiftUI

struct ReservationItemView: View {
    // MARK: - プロパティー
    var reservationHeaderItem: ContentsHeaderItem

    // MARK: - ボディー

    var body: some View {
        VStack {
            /// コンテンツヘッダー
            ContentsHeaderView(item: reservationHeaderItem, year: 2023)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(imageData(), id: \.self) { item in
                        HStack {
                            Image(item)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 160, height: 100)

                        }
                        .padding(.vertical, 4)
                        .background(Rectangle().stroke(.gray, lineWidth: 0.5))

                    }//: ループ

                }//: HStack
                .padding(.trailing, 20)

            }//: ScrollView

        }//: VStack

    }//: ボディー

    private func imageData() -> [String] {
        let data = TestData.shared
        switch reservationHeaderItem {
        case .christmas:
            return data.reservation
        case .newYear:
            return data.osechiItems
        }
    }
}

#Preview {
    ReservationItemView(reservationHeaderItem: .christmas)
}
