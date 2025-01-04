//
//  View-Extension.swift
//  PinchApp_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/15.
//

import Foundation
import SwiftUI

extension View {

    func doubleTapToZoom(scale: Binding<CGFloat>, isWrappedValue: Bool, animation: Animation, TapGestureCount count: Int) -> some View {
        return self
            .onTapGesture(count: count) {
                if isWrappedValue {
                    withAnimation(animation) {
                        scale.wrappedValue = 5
                    }
                } else {
                    withAnimation(animation) {
                        scale.wrappedValue = 1
                    }
                }
            }
    }
}
