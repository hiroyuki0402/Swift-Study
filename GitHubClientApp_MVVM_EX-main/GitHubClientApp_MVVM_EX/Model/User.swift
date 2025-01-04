//
//  User.swift
//  GitHubClientApp_MVVM_EX
//
//  Created by SHIRAISHI HIROYUKI on 2022/03/08.
//

import Foundation

final class User: Decodable {
    let id: Int
    let name: String
    let iconUrl: String
    let webUrl: String

    init(attributes: [String: Any]) {
        id = attributes["id"] as! Int
        name = attributes["login"] as! String
        iconUrl = attributes["avatar_url"] as! String
        webUrl = attributes["html_url"] as! String
    }
}
