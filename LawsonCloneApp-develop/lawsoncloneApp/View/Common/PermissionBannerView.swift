//
//  PermissionBannerView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/29.
//

import SwiftUI

struct PermissionBannerView: View {
    // MARK: - プロパティー

    var isHide: Bool = false

    var complision: (() -> Void)?

    // MARK: - ボディー

    var body: some View {
        if !isHide {
            HStack(spacing: 0) {
                Image(systemName: "info.circle")
                    .foregroundStyle(.navigationBar)
                    .font(.title2)

                Text("タップして「トラッキングを許可」をオンにすると、興味のある商品のクーポンやお知らせが届きます")
                    .padding()
                    .font(.caption)
                    .fontWeight(.light)
                    .fontDesign(.rounded)

                Button {
                    if let complision = complision {
                        complision()
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.gray)
                }


            }
            .background(.white)
            .frame(maxWidth: .infinity)
        }
    }//: ボディー
}

#Preview {
    PermissionBannerView()

        .background(Color.black)

}
