//
//  QuantityFavouriteDetailView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/01.
//

import SwiftUI

struct QuantityFavouriteDetailView: View {
    // MARK: - プロパティー
    @EnvironmentObject var shop: Shop
    @State private var counter: Int = 0

    // MARK: - ボディー

    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            Button {
                if counter > 0 {

                  counter -= 1
                }
            } label: {
                Image(systemName: "minus.circle")
            }

            Text("\(counter)")
              .fontWeight(.semibold)
              .frame(minWidth: 36)

            Button {
                if counter < 100 {

                  counter += 1
                }
            } label: {
                Image(systemName: "plus.circle")
            }

            Spacer()

            Button {

            } label: {
                Image(systemName: "heart.circle")
                  .foregroundColor(.pink)
            }
        }//: HSTack
        .font(.system(.title, design: .rounded))
        .foregroundColor(.black)
        .imageScale(.large)
    }//: ボディー
}

#Preview {
    QuantityFavouriteDetailView()
        .environmentObject(Shop())
}
