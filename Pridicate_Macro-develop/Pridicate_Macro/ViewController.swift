//
//  ViewController.swift
//  Pridicate_Macro
//
//  Created by SHIRAISHI HIROYUKI on 2023/09/25.
//

import UIKit

class ViewController: UIViewController {

    private let model = PersonViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        model.loadData { [weak self] in
            guard let self = self else { return }
            /// 年齢指定して年齢未満のパーソンを取得
            self.model.pridicate(underNYearsOld: 21) { datas in
                print(datas)
            }
        }

    }
}

