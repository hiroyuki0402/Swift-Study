//
//  ProfileView.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/17.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - プロパティー
    var userData: UserData
    @State private var selectedFilter: ProfileThredFilter = .threds
    @Namespace var animation


    // MARK: - ボディー
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {

                /// ヘッダー
                header

                /// フォロワーボタン
                followerButton

                VStack {
                    /// タブ
                    thredTabArea

                    /// スレッド
                    thredListArea
                }
                .padding(.vertical)
            }
        }//: ScrollView
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                navigationBarTrailingItem
            }
        }
        .padding(.horizontal)
    }//: ボディー
}
// MARK: - ProfileViewアイテム

private extension ProfileView {
    // MARK: - ヘッダー

    /// ヘッダーアイテム
    private var header: some View {
        HStack(alignment: .top) {
            /// ユーザー情報
            userInfoArea

            Spacer()

            /// アイコン
            ProfileImageView(userdata: userData, frameSize: 60)
        }
    }

    /// ユーザー情報
    private var userInfoArea: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                /// フルネーム
                Text(userData.fullName)
                    .font(.title2)
                    .fontWeight(.semibold)
                /// ニックネーム
                Text(userData.userName)
                    .font(.subheadline)

            }
            /// 自己紹介
            if let bio = userData.bio {
                Text(bio)
                    .font(.footnote)
            }

            /// フォロワー
            Text("フォロワー２人")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }

    // MARK: - フォロワー

    private var followerButton: some View {
        Button {

        } label: {
            Text("follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 352, height: 32)
                .background(.black)
                .cornerRadius(8)
        }
    }

    // MARK: Threadタブ
    /// スレッドタブの幅
    private var thredFilterWidht: CGFloat {
        let count = CGFloat(ProfileThredFilter.allCases.count)
        let screenWidth = UIScreen.main.bounds.width
        let margin = 20.0
        return screenWidth / count - margin
    }

    /// スレッドタブ
    private var thredTabArea: some View {
        HStack {
            ForEach(ProfileThredFilter.allCases) { item in
                let isSlected = selectedFilter == item
                VStack {
                    Text(item.title)
                        .font(.headline)
                        .foregroundColor(isSlected ? .blue: .black)


                    if selectedFilter == item {
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(width: thredFilterWidht, height: 1)
                            .matchedGeometryEffect(id: "item", in: animation)
                    } else {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: thredFilterWidht, height: 1)
                    }
                }
                .onTapGesture {
                    withAnimation() {
                        selectedFilter = item
                    }
                }
            }
        }
    }

    // MARK: ー スレッド一覧

    private var thredListArea: some View {
        LazyVStack {
            ForEach(0 ... 10, id:\.self) { item in
              //  ThreadListViewItem()
            }
        }
    }

    // MARK: - BarbuttonItem
    /// 右側のアイテム
    private var navigationBarTrailingItem: some View {
        Button {
            AuthService.shared.signout()
        } label: {
            Image(systemName: "line.3.horizontal")
        }
    }

}

#Preview {
    ProfileView(userData: TestData.shared.userData)
}

// MARK: - スレッドタブアイテム

enum ProfileThredFilter: Int, CaseIterable, Identifiable {
    case threds
    case replies

    var id: Int {
        return self.rawValue
    }

    var title: String {
        switch self {
        case .threds:
            return "スレッド"
        case .replies:
            return "返信"
        }
    }
}
