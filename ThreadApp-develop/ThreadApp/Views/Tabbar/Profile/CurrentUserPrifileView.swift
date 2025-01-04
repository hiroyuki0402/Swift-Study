//
//  CurrentPrifileView.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/22.
//

import SwiftUI

struct CurrentUserPrifileView: View {
    // MARK: - プロパティー
    @StateObject var profileViewModel = CurrentPrifileViewModel()
    @State private var selectedFilter: ProfileThredFilter = .threds
    @Namespace var animation
    @State var isShowEditView: Bool = false

    private var currentUser: UserData? {
        return profileViewModel.createUser
    }
    // MARK: - ボディー
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {

                    /// ヘッダー
                    header

                    /// 編集等
                    selfOperationButton


                    VStack {
                        /// タブ
                        thredTabArea

                        /// スレッド
                        thredListArea
                    }
                    .padding(.vertical)
                }
            }//: ScrollView
            .sheet(isPresented: $isShowEditView, content: {
                if let currentUser = currentUser  {
                    EditProfileView(userData: currentUser)
                } else {
                    // TODO: - currentUserが取れなかった時の処理
                    
                    ///テストデータ
                    EditProfileView(userData: TestData.shared.userData)
                }
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    navigationBarTrailingItem
                }
            }
            .padding(.horizontal)
        }//: NavigationStack
    }
}

private extension CurrentUserPrifileView {
    // MARK: - ヘッダー
    
    /// ヘッダーアイテム
    private var header: some View {
        HStack(alignment: .top) {
            /// ユーザー情報
            userInfoArea
            
            Spacer()
            
            /// アイコン
            ProfileImageView(userdata: currentUser ,frameSize: 60)
        }
    }
    
    /// ユーザー情報
    private var userInfoArea: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                /// フルネーム
                Text(profileViewModel.createUser?.fullName ?? "")
                    .font(.title2)
                    .fontWeight(.semibold)
                /// ニックネーム
                Text(profileViewModel.createUser?.userName ?? "")
                    .font(.subheadline)
                
            }
            /// 自己紹介
            if let bio = profileViewModel.createUser?.bio {
                Text(bio)
                    .font(.footnote)
            }
            
            /// フォロワー
            Text("フォロワー２人")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }

    // MARK: - 編集
    private var selfOperationButton: some View {

        HStack(alignment: .center, spacing: 4) {
            Button {
                isShowEditView.toggle()
            } label: {
                Text("プロフィールの編集")
                    .frame(maxWidth: .infinity)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .frame(height: 32)
                    .background(.white)
                    .cornerRadius(8)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(.black))
            }

            Button {

            } label: {
                Text("プロフィールのシェア")
                    .frame(maxWidth: .infinity)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .frame(height: 32)
                    .background(.white)
                    .cornerRadius(8)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(.black))
            }
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 4)
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
               // ThreadListViewItem(threadData: <#ThredData#>)
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
    CurrentUserPrifileView()
}
