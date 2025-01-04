//
//  ViewController.swift
//  CoinApp2021
//
//  Created by SHIRAISHI HIROYUKI on 2021/10/02.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    /// コインのViewモデル
    private var coinDatas: CoinListViewModel?

    // MARK: -  ライフサイクル

    override func viewDidLoad() {
        super.viewDidLoad()
        coinDatas = CoinListViewModel(coinViewListModel: [])
        configureTableView()
        fectchDatas()
    }

    // MARK: - メソッド

    /// テーブルビューの構築
    private func configureTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CoinInfoCell", bundle: nil), forCellReuseIdentifier: "CoinInfoCell")
    }


    /// データの取得
    private func fectchDatas() {
        coinDatas?.fectchDatas { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = coinDatas?.numberOfRowsInSection() else { return 0}
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinInfoCell", for: indexPath) as? CoinInfoCell else {
            return UITableViewCell()
        }
        let data = coinDatas?.coinDataAtIndex(at: indexPath.row)
        cell.configureCoinInfoCell(title: data?.currency, pricre: data?.price)
        cell.backgroundColor = .randomColor()

        return cell
    }


}
