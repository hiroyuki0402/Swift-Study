//
//  AnimalGridItemView.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/28.
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK: - プロパティー

    var animalsData: AnimalsData

    // MARK: - ボディー
    var body: some View {
        Image(animalsData.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)

    }//: ボディ
}

#Preview {
    AnimalGridItemView(animalsData: AnimalsViewModel().getAnimalData(at: 0))
}
