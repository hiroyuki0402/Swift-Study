//
//  GalleryView.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/22.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - プロパティー

    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    @State private var selectedImage: String = "lion"

    var animalsViewModel = AnimalsViewModel()
    let haptics = UIImpactFeedbackGenerator(style: .medium)

    // MARK: - ボディー
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {

            VStack {
                /// イメージ
                Image(selectedImage)
                  .resizable()
                  .scaledToFit()
                  .clipShape(Circle())
                  .overlay(Circle().stroke(Color.white, lineWidth: 8))

                /// スライダー
                Slider(value: $gridColumn, in: 0...4, step: 1)
                    .padding()
                    .onChange(of: gridColumn) {
                        withAnimation(.easeIn) {
                            gridSwitch()
                        }
                    }

                /// グリッド
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animalsViewModel.animalDatas) { item in
                    Image(item.image)
                      .resizable()
                      .scaledToFit()
                      .clipShape(Circle())
                      .overlay(Circle().stroke(Color.white, lineWidth: 1))
                      .onTapGesture {
                          selectedImage = item.image
                          haptics.impactOccurred()
                      }
                  } //: LOOP
                }//: LazyVGrid
                .onAppear(perform: {
                    withAnimation(.easeIn) {
                        gridSwitch()
                    }
                })
            }//: VStack

        }//: ScrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }//: ボディ

    // MARK: - メソッド
    private func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
      }
}

#Preview {
    GalleryView()
}
