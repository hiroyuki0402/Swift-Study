//
//  ViewController.swift
//  SweetsSearchAppEx
//
//  Created by SHIRAISHI HIROYUKI on 2021/12/29.
//

import UIKit
import SafariServices
class ViewController: UIViewController {
    @IBOutlet weak var sweetsSearchBar: UISearchBar! {
        didSet {
            sweetsSearchBar.placeholder = "お菓子を入力してください"
        }
    }
    @IBOutlet weak var tableView: UITableView!
    private let apiKey = "guest"
    private var sweetslist = [SweetsData]()
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sweetslist.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sweetslist[indexPath.row].name
        if let imageData = try? Data(contentsOf: sweetslist[indexPath.row].image) {
            let image = UIImage(data: imageData)
            cell.imageView?.image = image
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let safariVc = SFSafariViewController(url: sweetslist[indexPath.row].link)
        safariVc.delegate = self
        present(safariVc, animated: true, completion: nil)
    }

}

extension ViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        if let searhWord = searchBar.text {
            searchSweets(keyWord: searhWord)
            print(searhWord)
        }
    }

    func searchSweets(keyWord: String) {
        guard let keyWordEncode = keyWord.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }

        guard let reqUrl = URL(string: "https://sysbird.jp/toriko/api/?apikey=\(apiKey)&format=json&keyword=\(keyWordEncode)&max=10&order=r") else {return}
        print(reqUrl)

        let req = URLRequest(url: reqUrl)
        /// data転送を管理するためのセッション
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        /// リクエストをタスクとして登録
        let task = session.dataTask(with: req) {  data, resoponse, err in
            /// セッション終了
            session.finishTasksAndInvalidate()
            if let data = data {
                do {
                    /// JSONDecoderのインスタンス取得
                    let decoder = JSONDecoder()
                    /// 受け取ったデータをパース
                    let json = try decoder.decode(ResultJson.self, from: data)

                    if let item = json.item {
                        self.sweetslist = item.compactMap({ result in
                            SweetsData(name: result.name, maker: result.maker, link: result.url, image: result.image)
                        })
                    }
                    print(self.sweetslist.compactMap{ $0.name })
                    self.tableView.reloadData()

                } catch {
                    print(":",err.debugDescription)
                }
            }
        }
        /// ダウンロード開始
        task.resume()
    }
}

extension ViewController: SFSafariViewControllerDelegate {

    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true, completion: nil)
    }
}


struct ItemJson: Codable {
    let name: String
    let maker: String
    let url: URL
    let image: URL
}

struct ResultJson: Codable {
    let item: [ItemJson]?
}

class SweetsData {
    let name: String
    let maker: String
    let link: URL
    let image: URL
    init(name: String,
         maker: String,
         link: URL,
         image: URL){
        self.name = name
        self.maker = maker
        self.link = link
        self.image = image
    }
}

