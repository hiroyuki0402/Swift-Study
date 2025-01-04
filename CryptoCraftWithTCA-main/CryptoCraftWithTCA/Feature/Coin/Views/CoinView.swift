//
//  CoinView.swift
//  CryptoCraftWithTCA
//
//  Created by SHIRAISHI HIROYUKI on 2024/04/06.
//

import SwiftUI
import ComposableArchitecture

struct CoinView: View {
    // MARK: - プロパティー
    
    let store: Store<CoinState, CoinAction>
    
    // MARK: - Body
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            List {
                ForEach(viewStore.coindatas, id: \.self) { data in
                    ListItemView(coinData: data)
                }
                
            }//: List
            .onAppear {
                viewStore.send(.fetchCoinDatas)
            }
            
        }//: WithViewStore
    }
}

#Preview {
    CoinView(store: Store(initialState: CoinState(), reducer: {
        CoinReducer()
    }))
}
