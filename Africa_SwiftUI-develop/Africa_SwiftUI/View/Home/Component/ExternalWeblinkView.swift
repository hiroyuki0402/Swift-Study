//
//  ExternalWeblinkView.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/26.
//

import SwiftUI

struct ExternalWeblinkView: View {
    // MARK: - プロパティー

    let animalData: AnimalsData

    // MARK: - ボディ

    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()

                Group {
                    Image(systemName: "arrow.up.right.square")

                    Link(animalData.name, destination: animalData.link.toURL())
                }//: Group
                .foregroundColor(.accentColor)
            }//: HStack
        }//: GroupBox
    }//: ボディ
}

#Preview {
    ExternalWeblinkView(animalData: AnimalsViewModel().getAnimalData(at: 0))
        .previewLayout(.sizeThatFits)
        .padding()
}
