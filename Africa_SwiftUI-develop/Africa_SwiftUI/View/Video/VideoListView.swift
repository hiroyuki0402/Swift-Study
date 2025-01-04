//
//  VideoListView.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/22.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - プロパティー

    /// VideoViewModelのインスタンス。ビデオデータの状態を管理
    @StateObject var videoViewModel = VideoViewModel()

    /// UIのフィードバックを提供するための触覚フィードバックジェネレーター
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    // MARK: - ボディー
    var body: some View {

        /// ナビゲーションビューを用いて、ビデオリストを表示
        NavigationView {

            /// リストビュー。各ビデオデータはVideoListItemで表示
            List {
                ForEach(videoViewModel.videoDatas) { item in
                    NavigationLink(destination: VideoPlayerView(fileName: item.id)) {
                        VideoListItem(video: item)
                            .padding(.vertical, 8)
                    }
                }//: ForEach
            }//: List
            .listStyle(.grouped)
            .navigationBarTitle("Video", displayMode: .inline)
            .toolbar {

                /// ナビゲーションバーの右側に配置するツールバーアイテム
                ToolbarItem(placement: .navigationBarTrailing) {

                    /// データシャッフルボタン。押すとビデオデータがシャッフル
                    Button(action: {

                        /// VideoViewModelのshuffleDataメソッドを呼び出してデータをシャッフル
                        videoViewModel.shuffleData()

                        /// 触覚フィードバックを発生させる
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            }
        }//: NavigationView
    }
}


#Preview {
    VideoListView()
}
