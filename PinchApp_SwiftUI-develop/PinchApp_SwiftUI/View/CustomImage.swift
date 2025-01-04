//
//  Image.swift
//  PinchApp_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/15.
//

import SwiftUI

struct CustomImage: View {
    /// リソース
    var imageName: String?

    /// モード
    var imagecontentMode: ContentMode?
    var cornerRadius: CGFloat?
    var imageOpacity: CGFloat?
    var imageScale: CGFloat
    var imageOffset: CGSize = .zero

    /// サイズ
    var framWidht: CGFloat?
    var frmaHeigth: CGFloat?

    /// シャドー
    var shadowColor: Color = .black
    var colorOpacity: CGFloat = 0.3
    var shadowX: CGFloat = 2
    var shadowY: CGFloat = 2
    var shadowRadius: CGFloat = 12

    /// フラグ
    var isAnimating: Bool = false


    var body: some View {
        Image(imageName ?? "")
            .resizable()
            .aspectRatio(contentMode: imagecontentMode != nil ? imagecontentMode!: .fit)
            .cornerRadius(cornerRadius ?? 0)
            .frame(width: framWidht, height: frmaHeigth)
            .shadow(color: shadowColor.opacity(colorOpacity), radius: shadowRadius, x: shadowX, y: shadowY)
            .padding()
            .opacity(isAnimating ? 1: 0)
            .scaleEffect(imageScale)
            .offset(imageOffset)
    }
}

#Preview {
    CustomImage(imageName: "", imageScale: 1, isAnimating: true)
}
