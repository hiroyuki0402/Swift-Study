//
//  ViewController.swift
//  AssociatedEX
//
//  Created by SHIRAISHI HIROYUKI on 2023/03/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    var coustom: CustomArray<Any>!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://umayadia-apisample.azurewebsites.net/api/persons/Shakespeare")

        ApiManager.shared.callApi(url: url, type: Model.self) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure, ":", failure._code)
            }
        }

        coustom = CustomArray<Any>()
        for index in 0...10 {
            coustom.append(item: "item_index: \(index)")
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coustom.colllection.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = coustom.colllection[indexPath.row] as? String
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = item
        return cell
    }
}

