//
//  SizeSetterModifier.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/30.
//

import Foundation
import SwiftUI

struct WidthSetterModifier: ViewModifier {
    @Binding var width: CGFloat

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .preference(key: ViewWidthKey.self, value: geometry.size.width - 10)
                }
            )
            .onPreferenceChange(ViewWidthKey.self) { newWidth in
                self.width = newWidth
            }
    }
}

struct ViewWidthKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

