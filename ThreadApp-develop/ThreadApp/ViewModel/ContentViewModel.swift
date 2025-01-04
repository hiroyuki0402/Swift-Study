//
//  ContentViewModel.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/19.
//

import Foundation
import Combine
import Firebase

class ContentViewModel: ObservableObject {
    // MARK: - プロパティー

    /// 現在のFirebaseユーザーのセッション情報。
    /// @Publishedアノテーションにより、このプロパティの値が変更されると、
    /// 購読しているビューに変更が通知される
    @Published var userSection: FirebaseAuth.User?

    /// Combineフレームワークのサブスクリプションを保持するためのセット。サブスクリプションのメモリ管理に使用される
    private var cancellables = Set<AnyCancellable>()

    // MARK: - 初期化
    init() {
        /// サブスクライバーを設定するためのメソッドを呼び出す
        setupSubscribers()
    }

    // MARK: - メソッド

    /// AuthServiceからのユーザーセッションの更新を購読し、更新があるたびにuserSectionプロパティを更新
    /// これにより、ユーザーセッションの変更がビューに反映
    private func setupSubscribers() {
        AuthService.shared.$userSection.sink { [weak self] user in
            self?.userSection = user
        }
        .store(in: &cancellables)
    }

}
