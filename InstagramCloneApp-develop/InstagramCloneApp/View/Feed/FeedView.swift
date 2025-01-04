//
//  FeedView.swift
//  InstagramCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/11.
//

import SwiftUI

struct FeedView: View {
    // MARK: - プロパティー

    // MARK: - ボディー
    var body: some View {
        NavigationStack {
            ScrollView {

                HeaderView()

                LazyVStack(spacing: 32) {
                    ForEach(0...8, id: \.self) { item in
                        FeedItemView(image: "apple")
                    }
                }

            }
            .toolbar {
                /// ナビゲーションバーUserId
                ToolbarItem(placement: .topBarLeading) {
                    navigationBarUseridButton
                }

                /// アップロードメニュー
                ToolbarItem(placement: .topBarTrailing) {
                    navigationBarPlusButton
                }

                /// メニュー
                ToolbarItem(placement: .topBarTrailing) {
                    navigationBarMenuButton
                }
            }
        }

    }//: body
}

private extension FeedView {
    /// ナビゲーションバーUserId
    private var navigationBarUseridButton: some View {
        Button {

        } label: {
            HStack {
                Text("Instagram")
                    .font(.title2)
                    .fontWeight(.bold)
                Image(systemName: "chevron.down")
                    .font(.footnote)
            }
            .foregroundStyle(.gray)
        }
    }

    /// アップロードメニュー
    private var navigationBarPlusButton: some View {
        Button {

        } label: {
            Image(systemName: "heart")
                .font(.title3)
                .foregroundStyle(.gray)
        }
    }

    /// メニュー
    private var navigationBarMenuButton: some View {
        Button {

        } label: {
            Image(systemName: "message")
                .font(.title3)
                .foregroundStyle(.gray)
        }
    }
}


#Preview {
    FeedView()
}
