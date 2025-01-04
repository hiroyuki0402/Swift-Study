//
//  UserFeedItemView.swift
//  TwitterCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2024/06/08.
//

import SwiftUI

struct UserFeedItemView: View {
    // MARK: - プロパティー
    
    let followData: FollowData
    
    // MARK: - ボディー
    var body: some View {
        HStack(alignment: .top) {
            /// ユーザーのアイコン
            userImage()
            
            VStack(alignment: .leading) {
                nameArea()
                messageArea()
                mainImage()
                StatusItemView()
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
}

// MARK: - コンポーネント
private extension UserFeedItemView {
    ///メッセージエリア
    private func messageArea() -> some View {
        Text(followData.message)
    }
    
    /// ユーザー情報エリア
    private func nameArea() -> some View {
        HStack {
            userInfo()
            Spacer()
            someButton()
        }
    }
    
    /// ユーザー情報
    private func userInfo() -> some View {
        VStack {
            Text(followData.nickName)
                .font(.subheadline)
                .fontWeight(.bold)
            Text(followData.userID)
        }
    }
    
    /// 「フォローする」ボタン
    private func someButton() -> some View {
        Button {
            
        } label: {
            Text("・・・")
                .bold()
                .kerning(-7)
        }
    }
    
    /// ユーザーのアイコン
    private func userImage() -> some View {
        let url = URL(string: followData.imageUrl) ?? URL(string: "")
        return AsyncImage(url: url) { imagePhase in
            if let image = imagePhase.image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
        }
    }
    
    /// メイン画像
    private func mainImage() -> some View {
        let url = URL(string: followData.mainImageUrl) ?? URL(string: "")
        return AsyncImage(url: url) { imagePhase in
            if let image = imagePhase.image {
                image
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 450)
                    .scaledToFit()
            }
        }
    }
}

#Preview {
    UserFeedItemView(followData: TestData.followTestData())
}

