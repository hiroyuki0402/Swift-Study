//
//  CoinAction.swift
//  CryptoCraftWithTCA
//
//  Created by SHIRAISHI HIROYUKI on 2024/04/06.
//

import Foundation
import SwiftUI

enum CoinAction: Equatable {
    case fetchCoinDatas
    case fetchCoinDatasSuccess(CoinDatas?)
    case fetchCoinDatasFailure(String)
}
