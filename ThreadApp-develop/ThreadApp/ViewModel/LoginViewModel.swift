//
//  LoginViewModel.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/19.
//

import Foundation

class LoginViewModel: ObservableObject {
    // MARK: - プロパティー
    @Published var email: String = ""
    @Published var password: String = ""

    // MARK: - メソッド

    @MainActor
    /// ログイン
    func login() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
}
