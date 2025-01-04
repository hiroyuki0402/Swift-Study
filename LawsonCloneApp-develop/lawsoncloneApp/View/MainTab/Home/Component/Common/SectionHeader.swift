//
//  SectionHeader.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/08.
//

import SwiftUI

struct SectionHeader: View {
    var title: String
    var fontSize: CGFloat = 17
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.black)
                .fontWeight(.semibold)


            Spacer()

            Button {

            } label: {
                Text("すべて見る")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                    .padding(.trailing, 15)
            }
        }
    }
}

#Preview {
    SectionHeader(title: "テスト")
        .padding()
}
