//
//  ProfileView.swift
//  InstagramCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/09.
//

import SwiftUI

// MARK: ProfileView

/// プロフィール画面
struct ProfileView: View {
    // MARK: - プロパティー
    let images =  ["apple", "apple", "apple", "apple"]

    // MARK: - ボディー

    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    /// ユーザーのアイコン
                    userIcon

                    Spacer()

                    /// フォロワー関連
                    followerArea

                }//: HStack
                .padding(4)

                /// ユーザネーム 関連
                userNameArea

                /// プロフィール編集ボタン関連
                buttonHandleArea

                /// グリッドとの区切り線
                Divider()

                /// グリッド
                ImageGridItemView(coulumnSpace: 2, rowSpacing: 2, count: 3, imagese: images)

            }//: ScrollView
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
        }//: NavigationStack
    }//: body
}

// MARK: - ProfileViewアイテム

private extension ProfileView {

    /// ユーザーのアイコン
    private var userIcon: some View {
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
        }
        .frame(width: 80, alignment: .leading)
        .padding(.horizontal)
    }

    /// フォロワー関連
    private var followerArea: some View {
        HStack {
            ForEach(FollowerAreaItem.allCases) { item in
                FollowAreaButton(buttonTitle: item.title)
            }
        }
        .frame(maxWidth: .infinity)
    }

    /// ユーザネーム
    private var userNameArea: some View {
        VStack(alignment: .leading) {
            Text("ひろ")

            Button {

            } label: {
                HStack(spacing: 0) {
                    Image(.threedsIcon)
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Text("hiro5309")
                        .font(.system(size: 15))
                        .fontWeight(.light)
                        .foregroundStyle(.black)
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 4)
                .background(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray, lineWidth: 1)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }

    /// 編集ボタンエリア
    private var buttonHandleArea: some View {
        HStack {
            edirButton
            shareButton
        }
        .padding(.horizontal, 10)
    }

    /// 編集ボタン
    private var edirButton: some View {
        ProfileEditAreaButton(title: "プロフィールを編集") {
            print("編集ボタン")
        }
    }

    /// シェアボタン
    private var shareButton: some View {
        ProfileEditAreaButton(title: "プロフィールをシェア") {
            print("シェアボタン")
        }
    }

    /// ナビゲーションバーUserId
    private var navigationBarUseridButton: some View {
        Button {

        } label: {
            HStack {
                Text("hiro5309")
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
            Image(systemName: "plus.app")
                .font(.title3)
                .foregroundStyle(.gray)
        }
    }

    /// メニュー
    private var navigationBarMenuButton: some View {
        Button {

        } label: {
            Image(systemName: "line.horizontal.3")
                .font(.title3)
                .foregroundStyle(.gray)
        }
    }
}

// MARK: - Preview

#Preview {
    ProfileView()
}
