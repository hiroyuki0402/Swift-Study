//
//  EditProfileView.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/18.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    // MARK: - プロパティー
    var userData: UserData
    @State private var bio: String = ""
    @State private var link: String = ""
    @State private var isPrivateProfile: Bool = false
    @Environment(\.dismiss) var dissmis
    @StateObject var editProfileViewModel = EditProfileViewModel()


    private let backGroundColor: Color = Color(.systemGroupedBackground)
    // MARK: - ボディー
    var body: some View {
        NavigationStack {
            ZStack {
                /// 背景色
                backGroundColor
                    .edgesIgnoringSafeArea([.bottom, .horizontal])

                VStack {
                    /// ユーザーネーム
                    nameArea
                    Divider()

                    ///自己紹介
                    bioArea
                    Divider()

                    ///リンク
                    linkArea
                    Divider()

                    /// プロフィール公開状況
                    privateProfileArea
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(
                            Color(.systemGray), lineWidth: 1
                        )
                }
                .padding()

            }//: ZStack
            .navigationTitle("プロフィールを編集")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    leadingBarItem
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingBarItem
                }
            }
        }//: NavigationStack
    }//: ボディー
}
// MARK: - EditProfileViewアイテム
private extension EditProfileView {

    // MARK: - プロフィールアイテム

    /// ユーザーネーム
    private var nameArea: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("名前")
                    .fontWeight(.semibold)

                Text(userData.fullName)
                    .fontWeight(.semibold)
            }
            Spacer()
            PhotosPicker(selection: $editProfileViewModel.seletedImage) {
                if let image = editProfileViewModel.photoImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                } else {
                    ProfileImageView(userdata: userData)
                }
            }
        }
    }
    /// 自己紹介
    private var bioArea: some View {
        VStack(alignment: .leading) {
            Text("自己紹介")
                .fontWeight(.semibold)

            TextField("+ 自己紹介を書く", text: $bio, axis: .vertical)
        }

    }
    /// リンク
    private var linkArea: some View {
        VStack(alignment: .leading) {
            Text("リンク")
                .fontWeight(.semibold)

            TextField("+ リンクを追加", text: $link, axis: .vertical)
        }
    }
    /// プロフィールの公開状況
    private var privateProfileArea: some View {
        Toggle("非公開プロフィール", isOn: $isPrivateProfile)
            .fontWeight(.semibold)
    }

    // MARK: - ナビゲーションバーアイテム
    /// 左側
    private var leadingBarItem: some View {
        Button("キャンセル") {
            dissmis()
        }
        .font(.subheadline)
        .foregroundColor(.black)
    }

    ///  右側
    private var trailingBarItem: some View {
        Button("完了") {
            Task {
                try await editProfileViewModel.updateUserData()
                dissmis()
            }
        }
        .font(.subheadline)
        .fontWeight(.semibold)
        .foregroundColor(.black)
    }
}

#Preview {
    EditProfileView(userData: TestData.shared.userData)
}
