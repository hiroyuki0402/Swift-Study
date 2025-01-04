//
//  NavigationBackGround.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/25.
//

import SwiftUI

struct NavigationBackGround: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // 放物線の開始点
        path.move(to: CGPoint(x: 0, y: -30))

        // 放物線の下端の点
        path.addLine(to: CGPoint(x: 0, y: rect.height * 0.8))

        // 放物線の曲線を描画
        let controlPoint1 = CGPoint(x: rect.width * 0.25, y: rect.height)
        let controlPoint2 = CGPoint(x: rect.width * 0.75, y: rect.height * 1)
        let endPoint = CGPoint(x: rect.width, y: rect.height * 0.8)

        path.addCurve(to: endPoint, control1: controlPoint1, control2: controlPoint2)

        // 放物線の終了点
        path.addLine(to: CGPoint(x: rect.width, y: -30))

        return path
    }
}

#Preview {
    VStack {
        NavigationBackGround()
            .frame(maxWidth: .infinity)
        .frame(height: 60)
        Spacer()
    }

}

