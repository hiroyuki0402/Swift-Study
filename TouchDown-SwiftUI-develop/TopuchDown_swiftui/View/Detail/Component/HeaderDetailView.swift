//
//  HeaderDetailView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/01.
//

import SwiftUI

struct HeaderDetailView: View {
    // MARK: - プロパティー
    @EnvironmentObject var shop: Shop
    // MARK: - ボディー


    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
          Text("Protective Gear")

          Text(shop.selectedProduct?.name ?? "")
            .font(.largeTitle)
            .fontWeight(.black)
        }) //: VSTACK
        .foregroundColor(.white)
      } //: ボディー
    }


#Preview {
    HeaderDetailView()
        .background(Color(UIColor.black))
        .environmentObject(Shop())
}
