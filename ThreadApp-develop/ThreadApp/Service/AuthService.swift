//
//  AuthService.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/19.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    // MARK: - プロパティー

    /// 現在ログインしているFirebaseユーザーの情報を保持するプロパティ
    @Published var userSection: FirebaseAuth.User?

    /// `AuthService`クラスのシングルトンインスタンス。このインスタンスを通じてアプリケーション全体で認証機能にアクセス可能
    static let shared = AuthService()

    // MARK: - メソッド

    /// クラスの初期化。Firebase Authenticationから現在のユーザー情報を取得し、`userSection`に割り当てる
    init() {
        userSection = Auth.auth().currentUser
    }

    @MainActor
    /// 指定されたメールアドレスとパスワードでユーザーをログインさせる
    /// - Parameters:
    ///   - email: ユーザーがログインするためのメールアドレス
    ///   - password: ユーザーがログインするためのパスワード
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            userSection = result.user
            try await UserService.shared.fetchCurrentUserData()
            Logger.showLog(result.user, greepWord: "Call Login API")
        } catch {
            Logger.showLog(error, greepWord: "Call Login API")
        }
    }

    @MainActor
    /// 新しいユーザーをFirebaseに登録する
    /// - Parameters:
    ///   - email: 新しいアカウントを作成するためのメールアドレス
    ///   - password: 新しいアカウントのパスワード
    ///   - fullName: ユーザーのフルネーム
    ///   - userName: ユーザーのユーザーネーム
    func createUser(email: String, password: String, fullName: String, userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSection = result.user
            let uploadData = UserData(id: result.user.uid, userName: userName, fullName: fullName, email: email)
            try await uploadUserData(uploadData)
            Logger.showLog(result.user, greepWord: "Call CreateUser API")
        } catch {
            Logger.showLog(error, greepWord: "Call CreateUser API")
        }
    }

    @MainActor
    /// 指定された`UserData`オブジェクトをFirebase Firestoreにアップロードする
    /// - Parameter userData: Firestoreにアップロードするユーザーの追加データ
    func uploadUserData(_ userData: UserData?) async throws {
        if let userData = userData {
            let encoderData = try Firestore.Encoder().encode(userData)
            try await Firestore.firestore().collection("users").document(userData.id).setData(encoderData)
            UserService.shared.curentUser = userData
        }
    }

    /// 現在のユーザーをFirebase Authenticationからログアウトさせる。これにより、ユーザーの認証状態がアプリ内で更新される
    func signout() {
        try? Auth.auth().signOut()
        self.userSection = nil
        UserService.shared.reset()
    }
}
