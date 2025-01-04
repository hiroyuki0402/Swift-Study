//
//  CampaignData.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/08.
//

import Foundation

struct CampaignData: Identifiable, Codable {
    let id: String
    let image: String
    let url: URL?
    let endDate: String
    let title: String
}

typealias CampaignDatas = [CampaignData]
