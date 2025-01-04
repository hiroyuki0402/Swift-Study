//
//  ProductItemView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/31.
//

import SwiftUI

struct ProductItemView: View {

    // MARK: - プロパティー
    var productData: ProductData
    // MARK: - ボディー

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            /// フォト
            ZStack {
                Image(productData.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
            .background(Color(
                red: productData.rgb.red,
                green: productData.rgb.green,
                blue: productData.rgb.blue))
            .cornerRadius(12)

            /// 商品名
            Text(productData.name)
                .font(.title3)
                .fontWeight(.black)
            /// 値段
            Text("￥" + (productData.price * 120).numberWidthComma())
                .fontWeight(.semibold)
                .foregroundColor(.gray)

        }//: VStack
    }
}

#Preview {
    ProductItemView(productData: ProductViewModel().getCategoryData(at: 0))
        .padding()
}
