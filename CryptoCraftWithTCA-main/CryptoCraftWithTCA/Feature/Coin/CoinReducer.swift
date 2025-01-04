//
//  CoinReducer.swift
//  CryptoCraftWithTCA
//
//  Created by SHIRAISHI HIROYUKI on 2024/04/06.
//

import Foundation
import ComposableArchitecture
import MyLibrary

@Reducer
struct CoinReducer {
    private var sampleURL: URL? = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")
    
    var body: some Reducer<CoinState, CoinAction> {
        Reduce { state, action in
            self.effectsAction(state: &state, action: action)
        }
    }
    
    // MARK: -
    
    private func effectsAction(state: inout CoinState, action: CoinAction) -> Effect<CoinAction> {
        switch action {
        case .fetchCoinDatas:
            return Effect.run { send in
                client(send: send)
            }
            
        case .fetchCoinDatasSuccess(let coinDatas):
            state.isLoading = false
            state.coindatas = coinDatas ?? []
            return .none
            
        case .fetchCoinDatasFailure(_):
            state.isLoading = false
            return .none
        }
    }
    
    private func client(send: Send<CoinAction>)  {
        Task {
            do {
                let coinDatas = try await MyLibrary.APIManager.shared.callAPI(url: sampleURL, method: .get, type: CoinDatas.self)
                await send(.fetchCoinDatasSuccess(coinDatas))
            } catch {
                return await send(.fetchCoinDatasFailure(error.localizedDescription))
            }
        }
    }
    
}
