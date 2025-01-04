//
//  CycleGroupView.swift
//  Restart-App
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/12.
//

import SwiftUI

struct CycleGroupView: View {

    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false

    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 240, height: 240, alignment: .center)

            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .blur(radius: isAnimating ? 0:10)
        .opacity(isAnimating ? 1: 0)
        .scaleEffect(isAnimating ? 1: 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    ZStack {
        Color(.colorBlue)
            .ignoresSafeArea()
        CycleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
    }
}
