//
//  NavigationBarDetailView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/01.
//

import SwiftUI

struct NavigationBarDetailView: View {

    // MARK: - プロパティー
    @EnvironmentObject var shop: Shop
    // MARK: - ボディー


    var body: some View {
        HStack {

            Button {
                withAnimation(.easeIn) {
                    shop.selectedProduct = nil
                    shop.showingProduct = false
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
            }

          Spacer()

          Button(action: {}, label: {
            Image(systemName: "cart")
              .font(.title)
              .foregroundColor(.white)
          })
        } //: HStack
    }//: ボディー
}

#Preview {
    NavigationBarDetailView()
        .background(Color.accentColor)
        .environmentObject(Shop())
}
