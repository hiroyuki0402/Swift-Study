//
//  RatingsSizesDetailView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/01.
//

import SwiftUI

struct RatingsSizesDetailView: View {
    // MARK: - プロパティー
    @EnvironmentObject var shop: Shop

    private let size: [String] = ["XS", "S", "M", "L", "XL"]

    // MARK: - ボディー

    var body: some View {
        HStack(alignment: .top, spacing: 3) {
            VStack(alignment: .leading, spacing: 3) {
                Text("レーティング")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)

                HStack(alignment: .center, spacing: 3)  {
                    ForEach(1...5, id: \.self) { item in
                        Button {

                        } label: {
                            Image(systemName: "star.fill")
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(Color(uiColor: .systemGray))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        Spacer()
            VStack(alignment: .trailing, spacing: 3) {
                Text("Sizes")
                  .font(.footnote)
                  .fontWeight(.semibold)
                  .foregroundColor(Color(uiColor: .systemGray))

                HStack(alignment: .center, spacing: 5) {
                    ForEach(size, id: \.self) { size in
                        Button {

                        } label: {
                            Text(size)
                                .font(.footnote)
                                .fontWeight(.heavy)
                                .foregroundColor(Color(uiColor: .systemGray))
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(Color.white.cornerRadius(5))
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color(uiColor: .gray), lineWidth: 2)
                                )
                        }
                    }
                }
            }
        }//: HStack
    }//: ボディー
}

#Preview {
    RatingsSizesDetailView()
        .environmentObject(Shop())
}
