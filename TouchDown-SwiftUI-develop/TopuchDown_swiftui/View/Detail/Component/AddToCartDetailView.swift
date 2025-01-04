//
//  AddToCartDetailView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/01.
//

import SwiftUI

struct AddToCartDetailView: View {
    // MARK: - プロパティー
    @EnvironmentObject var shop: Shop
    // MARK: - ボディー


    var body: some View {
        Button {

        } label: {
            Spacer()
            Text("追加する")
              .font(.system(.title2, design: .rounded))
              .fontWeight(.bold)
              .foregroundColor(.white)
            Spacer()
        }
        .padding(15)
        .background(
          Color(
            red: shop.selectedProduct?.color[0] ?? 255,
            green: shop.selectedProduct?.color[1] ?? 214,
            blue: shop.selectedProduct?.color[2] ?? 112
          )
        )
        .clipShape(Capsule())

    }//: ボディー
}

#Preview {
    AddToCartDetailView()
        .environmentObject(Shop())
        .background(Color.black)
}
