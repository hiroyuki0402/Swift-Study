//
//  CampaignViewModel.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/08.
//

import Foundation

class CampaignViewModel: ObservableObject {
    /// キャンペーンデータ
    /// バインドされているビューが自動的に更新
    @Published var campaignDatas: CampaignDatas = []

    init() {
        loadData()
    }
}

extension CampaignViewModel: ViewModelDataLoadable {
    typealias DataType = CampaignData

    /// TestData クラスからキャンペーンデータをロードする。
    func loadData() {
        campaignDatas = TestData.shared.campaignData
    }

    /// 指定されたインデックスにあるキャンペーンデータを取得する
    /// - Parameter index: 取得するデータのインデックス
    /// - Throws: `ViewModelError.indexOutOfRange` インデックスが範囲外の場合
    func getData(at index: Int) throws -> CampaignData {
        guard campaignDatas.indices.contains(index) else {
            throw ViewModelError.indexOutOfRange
        }
        return campaignDatas[index]
    }

    /// 新しいキャンペーンデータを配列に追加する。
    /// - Parameter item: 追加するキャンペーンデータ。
    func saveData(_ item: CampaignData) {
        campaignDatas.append(item)
    }

    /// 指定されたインデックスのキャンペーンデータを削除する。
    /// - Parameter index: 削除するデータのインデックス。
    /// - Throws: `ViewModelError.indexOutOfRange` インデックスが範囲外の場合。
    func deleteData(at index: Int) throws {
        guard campaignDatas.indices.contains(index) else {
            throw ViewModelError.indexOutOfRange
        }
        campaignDatas.remove(at: index)
    }
}

