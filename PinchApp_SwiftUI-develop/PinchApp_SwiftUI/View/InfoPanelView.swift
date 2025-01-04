//
//  InfoPanelView.swift
//  PinchApp_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/15.
//

import SwiftUI

struct InfoPanelView: View {

    var scale: CGFloat
    var offset: CGSize

    @State private var isInfoPanelVsible: Bool = false

    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .onLongPressGesture(minimumDuration: 1) {
                    isInfoPanelVsible.toggle()
                }

            Spacer()

            HStack(spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")

                Spacer()

                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")

                Spacer()

                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")

                Spacer()
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVsible ? 1: 0)

            Spacer()
        }
    }
}

#Preview {
    InfoPanelView(scale: 1, offset: .zero)
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        .padding()
}
