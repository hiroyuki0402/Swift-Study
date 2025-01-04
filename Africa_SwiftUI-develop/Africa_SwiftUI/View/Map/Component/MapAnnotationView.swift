//
//  MapAnnotationView.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/28.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - プロパティー

    /// このビューで表示するマップのデータ
    var mapData: MapData

    /// アニメーション
    @State var animating: Double = 0

    // MARK: - ボディー
    var body: some View {
        ZStack {
            Circle()
                .fill(.accent)
                .frame(width: 54, height: 54)

            Circle()
                .stroke(.accent, lineWidth: 2)
                .frame(width: 54, height: 54, alignment: .center)
                .scaleEffect(1 + CGFloat(animating))
                .opacity(1 - animating)

            Image(mapData.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
            
        }//: Zstack
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animating = 1
            }
        }
    }//: ボディ
}

#Preview {
    MapAnnotationView(mapData: MapViewModel().getAnimalData(at: 0))
}
