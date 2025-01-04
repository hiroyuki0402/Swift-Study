//
//  HelloWord.swift
//  SwiftUILearning
//
//  Created by SHIRAISHI HIROYUKI on 2023/04/08.
//

import SwiftUI
import UIKit

struct HelloWordView: View {

    @State private var viewTitle = "~HelloWorld~を色々変えてみる"
    @State private var title: String = "Hello Word"
    @State private var isAnimation = false
    @State private var isColor = false
    @State private var isbackgroudColor = false
    @State private var textColor = Color.black
    @State private var backgroudColor = Color.white


    var body: some View {
        ZStack {

            /// 背景色
            if isbackgroudColor {
                Color
                    .random()
                /// ignoresSafeAreaを付加する事で、背景色の表示領域をセーフエリア外までにする
                    .ignoresSafeArea(.all)
            }

        NavigationStack {
                VStack {
                    Spacer()

                    /// アニメーション
                    if isAnimation {
                        HStack {
                            ForEach(0..<title.count, id: \.self) { index in
                                LabelAnimationView(text: character(index: index), textSize: 30, startTime: Double(index))
                            }
                        }
                    }

                    /// 色変更
                    if isColor {
                        Text(title)
                            .bold()
                            .font(.system(size: 40))
                            .foregroundColor(textColor)
                    }
                    Spacer()

                    HStack {

                        /// アニメーション
                        Button {
                            isColor = false
                            isAnimation = !isAnimation ? true: true
                        } label: {
                            Text("アニメーション")
                                .bold()
                                .padding()
                                .foregroundColor(Color.white)
                                .background(Color.orange)
                                .cornerRadius(10)
                                .font(.system(size: 15))
                        }

                        /// 背景色
                        Button {
                            isbackgroudColor = false
                            isbackgroudColor = true
                        } label: {
                            Text("背景色の変更")
                                .bold()
                                .padding()
                                .foregroundColor(Color.white)
                                .background(Color.purple)
                                .cornerRadius(10)
                                .font(.system(size: 15))
                        }

                        /// 色変更
                        Button {
                            isAnimation = false
                            isColor = true
                            textColor = Color.random()
                        } label: {
                            Text("色変更")
                                .bold()
                                .padding()
                                .foregroundColor(Color.white)
                                .background(Color.yellow)
                                .cornerRadius(10)
                                .font(.system(size: 15))
                        }
                    }
                    .padding(.all)
                }
            }

            /// NavigationBar
            .navigationTitle("Hello Word")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    /// アニメーション用に文字列を１文字ずつ取り出す
    /// - Parameter index: 配列用のインデックス
    /// - Returns: インデックスに該当した文字
        func character(index: Int) -> String {
            var titles: [String] = []
            for atitle in title {
                titles.append(String(atitle))
            }
            return titles[index]
        }
    }

    struct HelloWord_Previews: PreviewProvider {
        static var previews: some View {
            HelloWordView()
        }
    }

