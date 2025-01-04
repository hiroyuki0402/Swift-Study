//
//  CoinInfoCell.swift
//  CoinApp2021
//
//  Created by SHIRAISHI HIROYUKI on 2021/10/02.
//

import UIKit

final class CoinInfoCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        priceLabel.text = nil
        self.backgroundColor = nil
    }

    /// CoinInfoCellの構築
    /// - Parameters:
    ///   - title: タイトル
    ///   - pricre: 値段
    func configureCoinInfoCell(title: String?, pricre: String?) {
        /// タイトル
        if let title = title {
            titleLabel.text = title
        }

        /// 値段
        if let pricre = pricre {
            priceLabel.text = pricre
        }
    }
}
