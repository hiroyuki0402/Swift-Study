//
//  Reservation.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/25.
//

import SwiftUI

struct ReservationView: View {
    // MARK: - プロパティー
    var reservationHeaderItem: ContentsHeaderItem
    // MARK: - ボディー

    var body: some View {
        VStack {

            /// セクションヘッダー
            SectionHeader(title: "ローソン予約アプリ")

            ForEach(ContentsHeaderItem.allCases) { item in
                /// コンテンツ
                ReservationItemView(reservationHeaderItem: item)
                    .padding(.vertical, 10)
            }

            /// 注意書き
            Text("※店舗によって取り扱いがない商品がございます。必ず商品の詳細をご確認ください。")
                .font(.footnote)
                .padding(.trailing, 20)
                .foregroundColor(.gray)
        }
    }//: ボディー
}

#Preview {
    ReservationView(reservationHeaderItem: .christmas)
}
