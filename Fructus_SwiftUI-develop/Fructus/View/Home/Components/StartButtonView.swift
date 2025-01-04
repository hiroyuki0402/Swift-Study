//
//  StartButtonView.swift
//  Fructus
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/18.
//

import SwiftUI

struct StartButtonView: View {

    // MARK: -  プロパティー
    @AppStorage("isOnboarding") var isOnboarding: Bool = true

    // MARK: - ボディー

    var body: some View {

        Button {
            isOnboarding = false
        } label: {
            HStack(spacing: 8) {
                Text("Start")

                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(.white, lineWidth: 1.25)
            )

        }//: Button
        .accentColor(.white)

    }
}

// MARK: - Preview

#Preview {
    StartButtonView()
        .previewLayout(.sizeThatFits)
        .background {
            Color.black
        }
}
