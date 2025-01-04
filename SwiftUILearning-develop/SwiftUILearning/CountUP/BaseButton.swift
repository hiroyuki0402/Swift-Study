//
//  BaseButton.swift
//  SwiftUILearning
//
//  Created by SHIRAISHI HIROYUKI on 2023/04/09.
//

import SwiftUI

struct BaseButton: View {
    let title: String
    let hegith: CGFloat
    let width: CGFloat
    let backColor: Color
    let textColor: Color
    let handler: () -> Void

    init(title: String = "Button", hegith: CGFloat, width: CGFloat, backColor: Color, textColor: Color, handler: @escaping () -> Void) {
        self.title = title
        self.hegith = hegith
        self.width = width
        self.backColor = backColor
        self.textColor = textColor
        self.handler = handler
    }


    var body: some View {
        Button(title) {
            handler()
        }
        .frame(width: width, height: hegith)
        .background(backColor)
        .foregroundColor(textColor)
    }
}
