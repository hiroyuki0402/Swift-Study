//
//  CategoryItemView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/31.
//

import SwiftUI

struct CategoryItemView: View {

    // MARK: - プロパティー

    var  categoryData: CategoryData
    // MARK: - ボディー
    

    var body: some View {
        Button {

        } label: {
            HStack {
                Image(categoryData.image)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(.gray)


            Text(categoryData.name.uppercased())
                .fontWeight(.light)
                .foregroundColor(.gray)

            Spacer()
                
            }//: HStack
            .padding()
            .background(Color.white.cornerRadius(12))
            .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 1)
            
            )

        }// ButtonLabel

    }//: ボディ
}

#Preview {
    CategoryItemView(categoryData: CategoryViewModel().getCategoryData(at: 0))
}
