//
//  FruitRowView.swift
//  Fructus
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/21.
//

import SwiftUI

struct FruitRowView: View {

    var fruitsData: FruitsData

    var body: some View {
        // セルの大枠
            HStack {
                // アイコンエリア
                Image(fruitsData.image)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .center)
                    .addShadow()

                    .background(
                        LinearGradient(colors: fruitsData.gradientColors, startPoint: .top, endPoint: .bottom)
                    )

                    .cornerRadius(8)

                // タイトルエリア
                VStack(alignment: .leading, spacing: 4) {
                    Text(fruitsData.title)
                        .font(.title3)
                        .fontWeight(.bold)
                    Text(fruitsData.headline)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .frame(height: 50)
                        .lineLimit(2)
                        .padding(.horizontal, 10)

                }
                .padding(20)
            }//: セルの大枠
        }
    }

#Preview {
    FruitRowView(fruitsData: FruitsViewModel().loadFruitsData(at: 0))
        .previewLayout(.sizeThatFits)
}
