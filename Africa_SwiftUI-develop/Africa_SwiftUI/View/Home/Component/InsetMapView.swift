//
//  InsetMapView.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/26.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    // MARK: - プロパティー

    /// posisionはMapの中心点と拡大縮小レベルを管理するための@Stateプロパティ
    @State private var posision = MapCameraPosition.region(
        MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599),
        span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)))

    // MARK: - ボディ

    var body: some View {
        /// Mapは地図を表示するViewです。posisionに基づいて中心位置と拡大縮小レベルが設定
        Map(position: $posision)
            /// overlayはMap上に別のViewを重ねるためのメソッド
            .overlay(
                /// NavigationLinkは新しい画面に遷移するリンク
                /// この場合、"MapView"画面に遷移
                NavigationLink(destination: MapView()) {
                    HStack {
                        /// mappin.circleという名前のシステムイメージを白色で表示
                        Image(systemName: "mappin.circle")
                          .foregroundColor(Color.white)

                        Text("Locations")
                          .foregroundColor(.accentColor)
                          .fontWeight(.bold)
                    }//: HStack
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                      Color.black
                        .opacity(0.4)
                        .cornerRadius(8))
                }//: NavigationLink
                    .padding(12)
                    , alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
        
    }//: ボディ
}

#Preview {
    InsetMapView()
        .previewLayout(.sizeThatFits)
        .padding()
}
