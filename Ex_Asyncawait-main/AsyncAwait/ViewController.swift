//
//  ViewController.swift
//  AsyncAwait
//
//  Created by SHIRAISHI HIROYUKI on 2023/05/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var users: User = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        Task {
            await fechUserData()
            tableView.reloadData()
        }
    }

    private func fechUserData() async {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        if let users = await APIManager.callApi(url: url, type: User.self) {
            print(users)
            self.users = users
        }
    }

}

// MARK: - bUITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userData = users[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = userData.name

        return cell
    }


}

