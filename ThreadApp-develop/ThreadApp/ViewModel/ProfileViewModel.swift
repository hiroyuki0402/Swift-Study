//
//  ProfileViewModel.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/21.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var currentUser: UserData?

    /// Combineフレームワークのサブスクリプションを保持するためのセット。サブスクリプションのメモリ管理に使用される
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubcribers()
    }

    private func setupSubcribers() {
        UserService.shared.$curentUser.sink { [weak self] userData in
            self?.currentUser = userData
        }
        .store(in: &cancellables)
    }
}
