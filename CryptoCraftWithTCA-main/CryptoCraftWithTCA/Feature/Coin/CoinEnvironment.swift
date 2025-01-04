//
//  CoinEnvironment.swift
//  CryptoCraftWithTCA
//
//  Created by SHIRAISHI HIROYUKI on 2024/04/06.
//

import Foundation
import ComposableArchitecture
import MyLibrary

struct CoinEnvironment {
    var apiManager: MyLibrary.APIManager
}

enum APIError: Error, Equatable {
    case networkError(String)
}
