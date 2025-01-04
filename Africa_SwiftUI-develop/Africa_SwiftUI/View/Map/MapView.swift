//
//  MapView.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - プロパティー

    @State private var region: MKCoordinateRegion = {
        let mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        let MapZoomLevel = MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
        let mapRegion = MKCoordinateRegion(
                center: mapCoordinate,
                span: MapZoomLevel)
        return mapRegion
    }()

    @StateObject var mapViewModel = MapViewModel()

    // MARK: - ボディー
    
    var body: some View {
        Map {
            ForEach(mapViewModel.mapDatas) { item in
                Annotation(item.name, coordinate: item.location) {
                    MapAnnotationView(mapData: item)
                }
            }
        }
    }
}

#Preview {
    MapView()
}
