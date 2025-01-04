//
//  NavigationBarView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/30.
//

import SwiftUI

struct NavigationBarView: View {


    // MARK: - プロパティー

    @State private var isAnimating: Bool = false

    // MARK: - ボディー
    var body: some View {
        HStack {

            /// 虫眼鏡
            Button {

            } label: {
                Image(systemName: "magnifyingglass")
                  .font(.title)
                  .foregroundColor(.black)
            }

            Spacer()

            /// ナビゲーションタイトル
            LogoView()
                .opacity(isAnimating ? 1: 0)
                .offset(x: 0, y: isAnimating ? 0: -25)
                .onAppear(perform: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isAnimating.toggle()
                    }
                })

            Spacer()

            /// 買い物かご
            Button {
            } label: {
              ZStack {
                Image(systemName: "cart")
                  .font(.title)
                  .foregroundColor(.black)

                Circle()
                  .fill(Color.red)
                  .frame(width: 14, height: 14, alignment: .center)
                  .offset(x: 13, y: -10)
              }
            }

        }//: HStack
        .padding()
    }//: ボディー

    // MARK: - メソッド
}

#Preview {
    NavigationBarView()
}
