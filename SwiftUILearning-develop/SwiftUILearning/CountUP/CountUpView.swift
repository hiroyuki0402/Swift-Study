//
//  CountUp.swift
//  SwiftUILearning
//
//  Created by SHIRAISHI HIROYUKI on 2023/04/08.
//

import SwiftUI

struct CountUpView: View {
    @State private var count = 0
    @State private var operetor =  "➕"
    @State private var type: CountType = .add

    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    /// UIの更新
                    Spacer()
                    updateUI(count: count)
                        .font(.system(size: 40))
                        .bold(true)

                    Spacer()
                    /// カウントアップのボタン
                    BaseButton(title: operetor, hegith: 70, width: 70, backColor: .yellow, textColor: .gray) {
                        switch type {

                        case .add:
                            count += 1
                        case .sub:
                            count -= 1
                        }
                    }
                        .cornerRadius(35)
                        .padding(.all, 30)
                    HStack {
                        /// 切り替えボタン
                        BaseButton(title: "切り替え", hegith: 50, width: 100, backColor: .red, textColor: .white) {
                            switch type {
                            case .add:
                                operetor = "➖"
                                type = .sub
                            case .sub:
                                operetor = "➕"
                                type = .add
                            }

                        }
                        .cornerRadius(10)
                        .padding(20)
                        Spacer()

                    /// リセットボタン
                        BaseButton(title: "クリア", hegith: 50, width: 100, backColor: .red, textColor: .white) { count = 0 }
                            .cornerRadius(10)
                            .padding(20)
                        }

                }
            }
            .navigationTitle("カウントアップ")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    /// テキスト更新
    func updateUI(count: Int) -> Text {
        let strCount = String(self.count)
        return Text(strCount)
    }
}

struct CountUp_Previews: PreviewProvider {
    static var previews: some View {
        CountUpView()
    }
}

enum CountType {
    case add
    case sub
}
