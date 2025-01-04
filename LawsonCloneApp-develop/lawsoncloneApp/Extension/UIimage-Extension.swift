//
//  Extension-UIimage.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/25.
//

import Foundation
import SwiftUI
import UIKit

extension UIImage {
    convenience init?(gradient: LinearGradient, size: CGSize) {
        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { context in
            let rect = CGRect(origin: .zero, size: size)
            let swiftUIContext = context.cgContext
            let layer = CAGradientLayer()
            layer.frame = rect
            layer.colors = [UIColor.blue.cgColor, UIColor.blue.withAlphaComponent(0.6).cgColor]
            layer.startPoint = CGPoint(x: 0.5, y: 0)
            layer.endPoint = CGPoint(x: 0.5, y: 1)
            layer.render(in: swiftUIContext)
        }
        self.init(cgImage: image.cgImage!)
    }
}
