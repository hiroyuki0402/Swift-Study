//
//  TredListViewItem.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/18.
//

import SwiftUI

struct ThreadListViewItem: View {
    // MARK: - プロパティー
    var threadData: ThredData

    // MARK: - ボディー

    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                /// アイコン
                userIcon

                VStack(alignment: .leading, spacing: 4) {
                    /// ユーザーネーム
                    userNameArea

                    /// メッセージ
                    mesageArea

                    /// アクション
                    actionArea
                }
            }//: HStack
            Divider()
        }//: VStack
        .padding()
    }//: ボディー
}

// MARK: - ThredCellsアイテム

private extension ThreadListViewItem {
// MARK: - アイコンエリア

    /// ユーザーアイコンエリアview
    private var userIconArea: some View {
        userIcon
    }

    /// ユーザアイコン
    private var userIcon: some View {
        ProfileImageView()
    }

    // MARK: -  ユーザーネームエリア

    /// ユーザーネームエリアView
    private var userNameArea: some View {
        HStack {
            userName
            Spacer()
            viewing
            ellipsis
        }
    }

    /// 名前
    private var userName: some View {
        Text("UserName")
            .font(.footnote)
            .fontWeight(.semibold)
    }

    /// 観覧件数
    private var viewing: some View {
        Text("\(threadData.timeStamp)")
            .font(.caption)
            .foregroundColor(Color(.systemGray3))
    }

    /// メニュー
    private var ellipsis: some View {
        Button {

        } label: {
            Image(systemName: "ellipsis")
                .foregroundColor(Color(.darkGray))
        }
    }

    // MARK: - メッセージエリア

    /// メッセージエリアView
    private var mesageArea: some View {
        mesage
    }

    /// メッセージ
    private var mesage: some View {
        Text(threadData.caption)
            .font(.footnote)
            .multilineTextAlignment(.leading)
    }

    // MARK: - アクションエリア

    /// アクションエリアView
    private var actionArea: some View {
        HStack(spacing: 16) {
            like
            bubble
            arrow
            paperplane
        }
        .padding(.vertical, 10)
        .foregroundColor(.black)
    }

    /// お気に入り
    private var like: some View {
        Button {

        } label: {
            Image(systemName: "heart")

        }
    }

    /// コメント
    private var bubble: some View {
        Button {

        } label: {
            Image(systemName: "bubble.right")

        }
    }

    /// リプライ
    private var arrow: some View {
        Button {

        } label: {
            Image(systemName: "arrow.rectanglepath")

        }
    }

    /// ポスト
    private var paperplane: some View {
        Button {

        } label: {
            Image(systemName: "paperplane")

        }
    }
}

#Preview {
    ThreadListViewItem(threadData: TestData.shared.threadData)
}
