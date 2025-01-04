//
//  TopPartDetailView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/01.
//

import SwiftUI

struct TopPartDetailView: View {
    // MARK: - プロパティー

    @State private var isAnimating: Bool = false
    @EnvironmentObject var shop: Shop
    // MARK: - ボディー


    var body: some View {
        HStack(alignment: .center, spacing: 6, content: {
          // PRICE
          VStack(alignment: .leading, spacing: 6, content: {
              Text("￥" + (shop.selectedProduct?.price.numberWidthComma() ?? ""))
              .fontWeight(.semibold)

              Text(shop.selectedProduct?.name ?? "")
              .font(.largeTitle)
              .fontWeight(.black)
              .scaleEffect(1.35, anchor: .leading)
          })
          .offset(y: isAnimating ? -50 : -75)

          Spacer()

          // PHOTO
            Image(shop.selectedProduct?.image ?? ProductViewModel().getCategoryData(at: 0).image)
            .resizable()
            .scaledToFit()
            .offset(y: isAnimating ? 0 : -35)
        })//: HSTACK
        .padding()
        .onAppear(perform: {
          withAnimation(.easeOut(duration: 0.75)) {
            isAnimating.toggle()
          }
        })
    }//: ボディー
}

#Preview {
    TopPartDetailView()
        .environmentObject(Shop())
}
