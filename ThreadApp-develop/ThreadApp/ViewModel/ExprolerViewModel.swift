//
//  ExprolerModel.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/22.
//

import Foundation

class ExprolerViewModel: ObservableObject {
    @Published var users: UserDatas = []

    init() {
        Task {
           try await fetchusers()
        }
    }

    @MainActor
    private func fetchusers() async throws {
        self.users = try await UserService.shared.fetchCurrentUserDatas()
    }

    func getuserData(at index: Int) -> UserData {
        return users[index]
    }
}
