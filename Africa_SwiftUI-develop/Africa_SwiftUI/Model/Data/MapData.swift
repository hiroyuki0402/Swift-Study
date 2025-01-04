//
//  MapData.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/28.
//

import Foundation
import MapKit

struct MapData: Codable, Identifiable {

    /// マップデータの一意な識別子
    let id: String

    /// 地域
    let name: String

    /// イメージ
    let image: String

    /// 緯度
    let latitude: Double

    /// 経度
    let longitude: Double

    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

typealias MapDatas = [MapData]
