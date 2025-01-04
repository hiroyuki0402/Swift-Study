//
//  PlayerDataViewModel.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/30.
//

import Foundation


class PlayerDataViewModel: ObservableObject {

    @Published var playerDatas: PlayerDatas = []

    init() {
        loadData()
    }

    func loadData() {
        let file = "player.json"
        if let decode = Bundle.main.decode(file, type: PlayerDatas.self) {
            playerDatas = decode
        }
    }

    func getPlayerData(at index: Int) -> PlayerData {
        return playerDatas[index]
    }

    func getPlayerDatas() -> PlayerDatas {
        return self.playerDatas
    }
}
