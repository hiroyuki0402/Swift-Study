//
//  AudioPlayer-Extension.swift
//  Restart-App
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/14.
//

import Foundation
import AVFoundation

extension AVAudioPlayer {

    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {

            var player = self
            do {
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                player.play()
            } catch {
                print("error")
            }

        }
    }
}
