//
//  ListItemView.swift
//  CryptoCraftWithTCA
//
//  Created by SHIRAISHI HIROYUKI on 2024/04/06.
//

import SwiftUI

struct ListItemView: View {
    // MARK: - プロパティー
    var coinData: CoinData
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .center) {
            Text(coinData.currency)
                .font(.title)
            
            Text(coinData.price)
                .font(.largeTitle)
                .bold()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ListItemView(coinData: .init(currency: "Test", price: "100.0"))
}
