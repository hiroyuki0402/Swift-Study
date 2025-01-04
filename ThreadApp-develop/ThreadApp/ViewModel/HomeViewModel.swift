//
//  HomeViewModel.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var thredDats: ThredDatas = []
    @Published var currentUserThredDatas: ThredDatas = []
    init() {
        Task {
            try await fetchThredsDatas()
        }
    }
    private func fetchThredsDatas() async throws {
        self.thredDats = try await ThredService.shared.fetchThreadDatas()
    }
}
