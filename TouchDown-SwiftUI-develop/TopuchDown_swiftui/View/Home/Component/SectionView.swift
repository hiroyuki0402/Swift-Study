//
//  SectionView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/31.
//

import SwiftUI

struct SectionView: View {

    // MARK: - プロパティー

    @State var rotateClockwise: Bool

    // MARK: - ボディー

    var body: some View {
        VStack(spacing: 0) {
          Spacer()

          Text("Categories".uppercased())
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .rotationEffect(Angle(degrees: rotateClockwise ? 90 : -90))

          Spacer()
        } //: VSTACK
        .background(Color(uiColor: .systemGray).cornerRadius(12))
        .frame(width: 85)
    }//: ボディー
}

#Preview {
    SectionView(rotateClockwise: true)
        .previewLayout(.fixed(width: 120, height: 240))
        .background()

}
