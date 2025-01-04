//
//  ContentView.swift
//  i_am_rich_app_swiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/09/23.
//

import SwiftUI
import SwiftUI

struct ContentView: View {

    private let navigationBarUIColor = #colorLiteral(red: 0.1490196078, green: 0.1960784314, blue: 0.2196078431, alpha: 1)
    private let backGroundColor = #colorLiteral(red: 0.4862745098, green: 0.5490196078, blue: 0.5529411765, alpha: 1)

    var body: some View {
        NavigationView {
            ZStack {

                Color(backGroundColor)
                /// 背景の全体に色をつける
                    .ignoresSafeArea()

                /// 画像
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity) // 幅は最大に拡張
                    .padding(.horizontal, 16)
                    .padding(.vertical, 20)
            }

            /// ナビウゲーションバーの設定
            .navigationBarColor(backgroundColor: Color(navigationBarUIColor))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                 ToolbarItem(placement: .principal) {
                     Text("I Am Rich")
                         .font(.system(size: 25))
                         .fontWeight(.bold)
                         .foregroundColor(.white)
                 }
             }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
