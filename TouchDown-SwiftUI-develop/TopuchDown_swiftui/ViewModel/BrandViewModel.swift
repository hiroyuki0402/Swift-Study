//
//  BrandViewModel.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/01.
//

import Foundation

class BrandViewModel: ObservableObject {

    @Published var brandDatas: BrandDatas = []

    init() {
        loadData()
    }

    func loadData() {
        let file = "brand.json"
        if let decode = Bundle.main.decode(file, type: BrandDatas.self) {
            brandDatas = decode
        }
    }

    func getCategoryData(at index: Int) -> BrandData {
        return brandDatas[index]
    }
}
