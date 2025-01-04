//
//  RegistraitionViewModel.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/19.
//

import Foundation

class RegistraitionViewModel: ObservableObject {
    // MARK: - プロパティー
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullName: String = ""
    @Published var nickName: String = ""

    // MARK: - メソッド

    @MainActor
    /// 会員登録
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, fullName: fullName, userName: nickName)
    }
}
