//
//  HomeViewModel.swift
//  TwitterCloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2024/06/06.
//

import Foundation
import MyLibrary

class HomeViewModel: ObservableObject {
    // MARK: - プロパティー
    
    /// ユーザーがフォローする候補のデータリスト
    @Published var whoToFollowData: WhoToFollowDatas = []
    
    @Published var followDatas: FollowDatas = []
    
    /// APIのエンドポイントとなるURL
    private let url = URL(string: "")
    
    // MARK: - 初期化
    init() {
        debugTestDatas()
    }
    
    // MARK: - メソッド
    
    /// APIを呼び出してフォロー候補データを取得し更新する
    private func callAPI() {
        Task {
            do {
                /// 非同期処理でAPIを呼び出しデータ取得/
                whoToFollowData = try await MyLibrary.APIManager.shared.callAPI(url: url, method: .get, type: WhoToFollowDatas.self) ?? []
            } catch {
                /// エラー発生時には空リストで更新/
                whoToFollowData = []
            }
        }
    }
    

}

// MARK: -  テストデータ
private extension HomeViewModel {
    /// テストデータを用いてフォロー候補データを設定
    private func debugTestDatas() {
        whoToFollowData = TestData.whoToFollowTestDatas()
        followDatas = TestData.followTestDatas()
    }
}
