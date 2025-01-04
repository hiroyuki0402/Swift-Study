//
//  VideoPlayer-Extension.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/27.
//

import Foundation
import AVKit
import SwiftUI

extension AVPlayer {
    
    /// AVPlayerを生成する
    /// - Parameter fileName: 再生予定のファイル名
    /// - Returns: AVPlayer
    static func palyer(fileName: String) -> AVPlayer {
        return AVPlayer(url: fileName.toVideoUrl(.mp4))
    }
}

