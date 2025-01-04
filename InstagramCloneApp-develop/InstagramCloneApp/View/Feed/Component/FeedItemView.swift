//
//  FeedItemView.swift
//  InstagramCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/12.
//

import SwiftUI

struct FeedItemView: View {
    // MARK: - プロパティー
    var image: String

    // MARK: - ボディー
    var body: some View {
        VStack {
            userIcon

            mainImage

            actionArea

            likeArea

            messageArea

            time
        }
    }//: body
}

private extension FeedItemView {

    private var userIcon: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
            .clipShape(Circle())

            Text("hiro")
                .font(.footnote)
                .fontWeight(.semibold)

            Spacer()

            Button {

            } label: {
                HStack(spacing: 0) {
                    Text("・")
                        .frame(width: 5)
                    Text("・")
                        .frame(width: 5)
                    Text("・")
                        .frame(width: 5)
                }
                .foregroundStyle(.gray)
                .fontWeight(.bold)
            }




        }
        .padding(.horizontal)
    }

    private var mainImage: some View {
        Image("apple")
            .resizable()
            .scaledToFill()
            .frame(height: 350)
            .frame(maxWidth: .infinity)
    }

    private var actionArea: some View {
        HStack {
            /// ライク
            Button {

            } label: {
                Image(systemName: "heart")
                    .imageScale(.large)
            }

            /// コメント
            Button {

            } label: {
                Image(systemName: "bubble.right")
                    .imageScale(.large)

            }

            /// ポスト
            Button {

            } label: {
                Image(systemName: "paperplane")
                    .imageScale(.large)
            }

            Spacer()

            /// ポスト
            Button {

            } label: {
                Image(systemName: "bookmark")
                    .imageScale(.large)
            }
        }
        .padding(.horizontal)
        .foregroundStyle(.gray)

    }

    private var likeArea: some View {
        HStack {
            Text("いいね!:")
            Text("eisuke_ashida、他")
            Spacer()
        }
        .padding(.top, 1)
        .padding(.horizontal)
    }

    private var messageArea: some View {
        HStack {
            Text("hiro ").fontWeight(.semibold) +
            Text("テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.footnote)
        .padding(.horizontal)
        .padding(.top, 1)
    }

    private var time: some View {
        HStack {
            Text("1時間前")
                .padding(.horizontal)
                .font(.footnote)
                .foregroundStyle(.gray)
                .fontWeight(.bold)
            Spacer()
        }
    }
}

#Preview {
    FeedItemView(image: "apple")
}
