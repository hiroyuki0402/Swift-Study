//
//  BrandItemView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/01.
//

import SwiftUI

struct BrandItemView: View {

    // MARK: - プロパティー

    var brandData: BrandData

    // MARK: - ボディー

    var body: some View {
        Image(brandData.image)
            .resizable()
            .scaledToFit()
            .padding()
            .background(Color.white.cornerRadius(12))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1))
    }
}

#Preview {
    BrandItemView(brandData: BrandViewModel().getCategoryData(at: 0))
}
