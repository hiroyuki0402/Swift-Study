//
//  HeaderView.swift
//  InstagramCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/12.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - プロパティー

    // MARK: - ボディー

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                HStack {
                    currentUserIcon
                        .padding(.horizontal, 5)

                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        userIcon
                            .padding(.horizontal, 5)
                    }
                }
                .padding(.leading)

                Divider()
            }

        }
    }//: ボディー
}

extension HeaderView {

    private var userIcon: some View {
        VStack {
            Image("apple")
                .resizable()
                .scaledToFill()
                .font(.largeTitle)
                .frame(width: 80, height: 80)
                .foregroundStyle(.white)
                .background(.gray)
                .clipShape(Circle())

            Text("アップル")
                .font(.footnote)
        }
    }

    private var currentUserIcon: some View {
        VStack {
            Image(systemName: "person")
                .font(.largeTitle)
                .frame(width: 80, height: 80)
                .foregroundStyle(.white)
                .background(.gray)
                .clipShape(Circle())
                .overlay (
                    Button {

                    } label: {
                        VStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundStyle(.gray)
                                .frame(width: 30, height: 30)
                        }
                        .frame(width: 30, height: 30)
                        .background(Color.white)
                        .clipShape(Circle())
                    }
                    ,alignment: .bottomTrailing
                )

            Text("ストーリーズ")
                .font(.footnote)
        }
        .frame(width: 80, alignment: .leading)
    }
}

#Preview {
    HeaderView()
}
