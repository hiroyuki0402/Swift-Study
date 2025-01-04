//
//  CurrentPrifileViewModel.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/23.
//

import SwiftUI
import Combine
import PhotosUI

class CurrentPrifileViewModel: ObservableObject {
    // MARK: - プロパティー

    @Published var createUser: UserData?

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
        UserService.shared.$curentUser.sink { [weak self] user in
            self?.createUser = user
        }
        .store(in: &cancellables)
    }
}
