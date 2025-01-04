//
//  View-Extension.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/24.
//

import Foundation
import SwiftUI

extension View {
    func addDivider(color: Color, width: CGFloat, height: CGFloat? = nil)  -> some View{
        Rectangle()
            .fill(color)
            .frame(width: width, height: height)
    }
}
