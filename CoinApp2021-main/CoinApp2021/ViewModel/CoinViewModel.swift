//
//  CoinViewModel.swift
//  CoinApp2021
//
//  Created by SHIRAISHI HIROYUKI on 2021/10/02.
//

import Foundation

class CoinListViewModel {

    /// モデルデータを格納するプライベートプロパティ
    private var coinViewListModel: CoinData

    /// 初期化メソッド
    /// - Parameter coinViewListModel: モデルデータ
    init(coinViewListModel: CoinData) {
        self.coinViewListModel = coinViewListModel
    }
}

class CoinViewModel {

    /// モデルデータを格納するプライベートプロパティ
    private let coinViewModel: CoinDatum

    /// 初期化メソッド
    /// - Parameter coinViewModel: モデルデータ
    init(coinViewModel: CoinDatum) {
        self.coinViewModel = coinViewModel
    }
}

extension CoinListViewModel {

    /// モデルデータの数を返す
    func numberOfRowsInSection() -> Int {
        return coinViewListModel.count
    }

    /// 指定したインデックスのモデルデータを取得
    /// - Parameter index: インデックス
    /// - Returns: 指定したインデックスのCoinViewModel
    func coinDataAtIndex(at index: Int) -> CoinViewModel {
        let coinData = self.coinViewListModel[index]
        return CoinViewModel(coinViewModel: coinData)
    }

    /// データを取得するメソッド
    /// - Parameter completion: データ取得後に実行されるクロージャ
    func fectchDatas(completion: @escaping () -> Void) {
        /// リクエスト先のURLを指定
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")
        /// ネットワークリクエストを実行
        APICallManager.shared.callAPi(url: url, type: CoinData.self) { [weak self] result in
            switch result {
            case .success(let coinData):
                self?.coinViewListModel = coinData
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension CoinViewModel {

    /// 通貨名を取得
    var currency: String {
        return coinViewModel.currency
    }

    /// 価格を取得
    var price: String {
        return coinViewModel.price
    }
}
