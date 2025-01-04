//
//  InsetFactView.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/26.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - プロパティー

    let animalDatas: AnimalsData

    // MARK: - ボディ

    var body: some View {
        GroupBox {
            TabView {
                ForEach(animalDatas.fact, id: \.self) { item in
                    Text(item)
                }
            }//: TabView
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)

        }//: BoGroupBoxx

    }
}//: ボディ

#Preview {
    InsetFactView(animalDatas: AnimalsViewModel().getAnimalData(at: 0))
        .previewLayout(.sizeThatFits)
        .padding()
}
