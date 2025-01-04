//
//  PageData.swift
//  PinchApp_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/15.
//

import Foundation

struct PagesData: Identifiable {
    let id: Int
    let imageName: String
}

extension PagesData {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}

class PageDataManager {
    class func pagesData() -> [PagesData] {
        return [
            .init(id: 0, imageName: "magazine-front-cover"),
            .init(id: 1, imageName: "magazine-back-cover")
        ]
    }
}
