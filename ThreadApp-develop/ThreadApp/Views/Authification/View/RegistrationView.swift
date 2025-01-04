//
//  RegistrationView.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/17.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - プロパティー
    @StateObject private var registraitionViewModel = RegistraitionViewModel()

    @Environment(\.dismiss) var dismis

    // MARK: - ボディー

    var body: some View {
        VStack {
            Spacer()
            /// アプリアイコン
            appIconeView

            /// 入力欄
            inputedArea

            /// 登録
            createDone

            Spacer()

            /// 区切り線
            Divider()

            /// ログイン
            singinView
        }//: VStack

    }//: ボディー
}

// MARK: - RegistrationView アイテム

private extension RegistrationView {
    /// アプリアイコン
    private var appIconeView: some View {
        Image(.threads)
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120)
    }

    /// 入力欄
    private var inputedArea: some View {
        VStack {
            TextField("E-Mailを入力してください", text: $registraitionViewModel.email)
                .textInputAutocapitalization(.none)
                .modifier(ThredFieldModifier())

            SecureField("パスワードを入力してください", text: $registraitionViewModel.password)
                .modifier(ThredFieldModifier())

            TextField("フルネームを入力してくだい", text: $registraitionViewModel.fullName)
                .modifier(ThredFieldModifier())

            TextField("ニックネームを入力してください", text: $registraitionViewModel.nickName)
                .textInputAutocapitalization(.none)
                .modifier(ThredFieldModifier())
        }
    }

    /// 登録
    private var createDone: some View {
        Button {
            Task {
                try await registraitionViewModel.createUser()
            }
        } label: {
            Text("登録")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: 350, height: 44)
                .background(.black)
                .cornerRadius(8)
        }
        .padding(.vertical)
    }

    /// ログイン
    private var singinView: some View {
        Button {
            dismis()
        } label: {
            HStack(spacing: 3) {
                Text("アカウントは存在している方は")
                Text("ログイン")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.black)
            .font(.footnote)
        }
    }
}

#Preview {
    RegistrationView()
}
