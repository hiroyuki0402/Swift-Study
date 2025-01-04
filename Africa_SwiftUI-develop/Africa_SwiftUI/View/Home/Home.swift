//
//  Home.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/22.
//

import SwiftUI

struct Home: View {
    // MARK: - プロパティー
    
    // MARK: - ボディ

    var body: some View {
        /// メインタブビュー
        TabView {
            /// コンテンツビュー
            ContentView()
              .tabItem {
                Image(systemName: "square.grid.2x2")
                Text("Browse")
              }

            /// ビデオビュー
            VideoListView()
              .tabItem {
                Image(systemName: "play.rectangle")
                Text("Watch")
              }

            /// マップビュー
            MapView()
              .tabItem {
                Image(systemName: "map")
                Text("Locations")
              }

            /// ギャラリービュー
            GalleryView()
              .tabItem {
                Image(systemName: "photo")
                Text("Gallery")
              }
        }
    }
}


#Preview {
    Home()
}
