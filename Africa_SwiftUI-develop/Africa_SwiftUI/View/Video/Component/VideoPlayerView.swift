//
//  VideoPlayerView.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/27.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - プロパティー

    // 動画ファイル名
    let fileName: String

    // MARK: - ボディー
    var body: some View {
        VideoPlayer(player: .palyer(fileName: fileName))
    }
}

#Preview {
    VideoPlayerView(fileName: "cheetah")
}

