//
//  ThredTextModifier.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/17.
//

import Foundation
import SwiftUI

struct ThredFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
