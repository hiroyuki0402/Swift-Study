//
//  WhoToFolloewView.swift
//  TwitterCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2024/06/04.
//

import SwiftUI

struct WhoToFolloewView: View {
    // MARK: - プロパティー
    
    let whoToFollowData: WhoToFollowData
    
    // MARK: - ボディー
    var body: some View {
        HStack(alignment: .top) {
            /// ユーザーのアイコン
            userImage()
            
            VStack(alignment: .leading) {
                nameArea()
                messageArea()
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
}

// MARK: - コンポーネント
private extension WhoToFolloewView {
    ///メッセージエリア
    private func messageArea() -> some View {
        Text(whoToFollowData.message)
    }
    
    /// ユーザー情報エリア
    private func nameArea() -> some View {
        HStack {
            userInfo()
            Spacer()
            follwButton()
        }
    }
    
    /// ユーザー情報
    private func userInfo() -> some View {
        VStack {
            Text(whoToFollowData.nickName)
                .font(.subheadline)
                .fontWeight(.bold)
            Text(whoToFollowData.userID)
        }
    }
    
    /// 「フォローする」ボタン
    private func follwButton() -> some View {
        Button {
            
        } label: {
            Text("フォローする")
                .font(.subheadline)
                .bold()
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(.black)
                .clipShape(.capsule)
        }
    }
    
    /// ユーザーのアイコン
    private func userImage() -> some View {
        let url = URL(string: whoToFollowData.imageUrl) ?? URL(string: "")
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
}

#Preview {
    WhoToFolloewView(whoToFollowData: TestData.whoToFollowTestData())
        .background(.blue)
}
