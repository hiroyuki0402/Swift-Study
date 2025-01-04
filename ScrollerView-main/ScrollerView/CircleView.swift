//
//  CircleView.swift
//  ScrollerView
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/04.
//

import SwiftUI

extension Color {
    static func random() -> Color {
        return Color(red: Double.random(in: 0...1),
                     green: Double.random(in: 0...1),
                     blue: Double.random(in: 0...1))
    }
}

struct CircleView: View {

    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(Color.random())
        }
    }
}

#Preview {
    CircleView()
}
