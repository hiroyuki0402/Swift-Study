//
//  VideoListItem.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/27.
//

import SwiftUI

struct VideoListItem: View {
    // MARK: - プロパティー

    /// このビューで表示するビデオのデータ
    var video: VideosData

    // MARK: - ボディー
    var body: some View {
        /// 水平方向に要素を並べるHStack
        HStack(spacing: 10) {

            /// ビデオイメージと再生アイコンを重ねるZStack
            ZStack {

                /// ビデオのサムネイルイメージ
                Image(video.id.makeImageName())
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)

                /// 再生アイコン
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }//: ZStack

            /// ビデオの詳細情報を表示するVStack
            VStack(alignment: .leading, spacing: 10) {

                /// ビデオの名前
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)

                /// ビデオの説明文
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }//: VStack
        }//: HStack
    }//: ボディ
}


#Preview {
    VideoListItem(video: VideoViewModel().getVideosData(at: 0))
}
