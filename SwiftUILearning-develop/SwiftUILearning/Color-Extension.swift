//
//  Color-Extension.swift
//  SwiftUILearning
//
//  Created by SHIRAISHI HIROYUKI on 2023/04/09.
//

import Foundation
import SwiftUI

extension Color {
    /// 色をランダムに生成
    /// - Returns: 色
    static func random() -> Color {
        let red: CGFloat = CGFloat.random(in: 0...1)
        let green: CGFloat = CGFloat.random(in: 0...1)
        let blue: CGFloat = CGFloat.random(in: 0...1)

        return Color.init(red: red, green: green, blue: blue)
    }
}
