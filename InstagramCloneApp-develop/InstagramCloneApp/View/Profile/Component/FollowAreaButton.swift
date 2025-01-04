//
//  FollowAreaButton.swift
//  InstagramCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/10.
//

import SwiftUI

enum FollowerAreaItem: Int, CaseIterable, Identifiable {
    case post, follower, follow
    var id: Int {
        return self.rawValue
    }

    var title: String {
        switch self {
        case .post:
            return "投稿"
        case .follower:
            return "フォロワー"
        case .follow:
            return "フォロー中"
        }
    }
}

struct FollowAreaButton: View {
    // MARK: - プロパティー

    /// ハンドラー
    var complisionHandler: (() -> Void)?

    var buttonTitle: String

    /// フォロワーなどの数よう
    var count: Int = 0

    // MARK: - ボディー

    var body: some View {
        VStack {
            Text("\(count)")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)

            Button {
                if let complisionHandler = self.complisionHandler {
                    complisionHandler()
                }
            } label: {
                Text(buttonTitle)
                    .font(.headline)
                    .fontWeight(.light)
                    .foregroundStyle(.black)
            }
        }
    }//: ボディー
}

#Preview {
    FollowAreaButton(buttonTitle: "投稿")
}
