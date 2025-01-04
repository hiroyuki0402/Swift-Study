//
//  LogoView.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/30.
//

import SwiftUI

struct LogoView: View {

    // MARK: - プロパティー

    // MARK: - ボディー

    var body: some View {
        HStack(spacing: 4) {
            Text("Touch".uppercased())
              .font(.title3)
              .fontWeight(.black)
              .foregroundColor(.black)

            Image("logo-dark")
              .resizable()
              .scaledToFit()
              .frame(width: 30, height: 30, alignment: .center)

            Text("Down".uppercased())
              .font(.title3)
              .fontWeight(.black)
              .foregroundColor(.black)
        }//: HStack
    }//: ボディー
}

#Preview {
    LogoView()
}
