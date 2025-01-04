//
//  LoginView.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/17.
//

import SwiftUI

struct LoginView: View {
    // MARK: - プロパティー
    @StateObject var loginViewModel = LoginViewModel()

    // MARK: - ボディー

    var body: some View {

        NavigationStack {

            VStack {
                Spacer()
                /// アプリアイコン
                appIconeView

                /// 入力欄
                inputedAreaView

                /// パスワードお忘れ
                forgotAreaView

                /// ログイン
                signinView

                Spacer()

                /// 区切り線
                Divider()

                /// 新規作成
                createAcountView
            }//: VStack

        } //: NavigationStack

    }//: ボディー
}

// MARK: - LoginView アイテム

private extension LoginView {
    /// アプリアイコン
    private var appIconeView: some View {
        Image(.threads)
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120)
    }

    /// 入力欄
    private var inputedAreaView: some View {
        VStack {
            TextField("E-Mailを入力してください", text: $loginViewModel.email)
                .textInputAutocapitalization(.none)
                .modifier(ThredFieldModifier())

            SecureField("パスワードを入力してください", text: $loginViewModel.password)
                .modifier(ThredFieldModifier())
        }
    }

    /// パスワードお忘れの方へ
    private var forgotAreaView: some View {
        NavigationLink {
            Text("パスワードを忘れた方へ")
        } label: {
            Text("パスワードを忘れた方へ")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.top)
                .padding(.trailing, 20)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }

    /// ログイン
    private var signinView: some View {
        Button {
            Task {
               try await loginViewModel.login()
            }
        } label: {
            Text("ログイン")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: 350, height: 44)
                .background(.black)
                .cornerRadius(8)
        }
    }

    /// 新規作成
    private var createAcountView: some View {
        NavigationLink {
            RegistrationView()
                .navigationBarBackButtonHidden()
        } label: {
            HStack(spacing: 3) {
                Text("アカウントが無いため")
                Text("新規登録")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.black)
            .font(.footnote)
        }
        .padding(.vertical, 16)
    }
}


#Preview {
    LoginView()
}
