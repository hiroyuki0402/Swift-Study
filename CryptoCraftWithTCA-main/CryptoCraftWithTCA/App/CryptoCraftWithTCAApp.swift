//
//  CryptoCraftWithTCAApp.swift
//  CryptoCraftWithTCA
//
//  Created by SHIRAISHI HIROYUKI on 2024/04/06.
//

import SwiftUI
import ComposableArchitecture

@main
struct CryptoCraftWithTCAApp: App {
    var body: some Scene {
        WindowGroup {
            CoinView(store: Store(initialState: CoinState(), reducer: {
                CoinReducer()
            }))
        }
    }
}
