//
//  ProductViewModel.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/31.
//

import Foundation

import SwiftUI

class ProductViewModel: ObservableObject {

    @Published var productDatas: ProductDatas = []

    init() {
        loadData()
    }

    func loadData() {
        let file = "product.json"
        if let decode = Bundle.main.decode(file, type: ProductDatas.self) {
            productDatas = decode
        }
    }

    func getCategoryData(at index: Int) -> ProductData {
        return productDatas[index]
    }


}
