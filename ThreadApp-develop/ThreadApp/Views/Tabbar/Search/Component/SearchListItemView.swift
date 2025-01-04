//
//  SearchListItemView.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/18.
//

import SwiftUI

struct SearchListItemView: View {
    // MARK: - プロパティー
    var userData: UserData
    // MARK: - ボディー
    var body: some View {
        /// セル
        cellItem
    }//: body
}

private extension SearchListItemView {
    /// セル
    private var cellItem: some View {
        VStack {
            HStack {
                /// アイコン
                userIcon

                VStack(alignment: .leading, spacing: 4) {
                    /// ユーザーネーム
                    userName
                    /// メッセージ
                    mesage
                }

                Spacer()
                /// フォロー
                follow
            }//: HStack
            .padding(.horizontal)
            Divider()
        }//: VStack
        .padding(.vertical, 4)
    }
    /// 名前
    private var userName: some View {
        Text(userData.fullName)
            .font(.footnote)
            .fontWeight(.semibold)
    }

    /// ユーザアイコン
    private var userIcon: some View {
        ProfileImageView(userdata: userData)
    }

    /// メッセージ
    private var mesage: some View {
        Text(userData.userName)
            .font(.footnote)
            .multilineTextAlignment(.leading)
    }

    ///
    private var follow: some View {
        Text("Follow")
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 32)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            }
    }
}

#Preview {
    SearchListItemView(userData: TestData.shared.userData)
}
