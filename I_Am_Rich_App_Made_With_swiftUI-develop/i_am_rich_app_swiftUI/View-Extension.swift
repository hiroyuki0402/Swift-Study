//
//  View-Extension.swift
//  i_am_rich_app_swiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/09/23.
//

import Foundation
import SwiftUI

extension View {
    func navigationBarColor(backgroundColor: Color) -> some View {
        modifier(NavigationBarColorModifier(backgroundColor: backgroundColor))
    }
}
