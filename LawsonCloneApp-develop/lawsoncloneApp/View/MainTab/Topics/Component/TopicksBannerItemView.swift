//
//  TopicksBannerItemView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/03.
//

import SwiftUI

struct TopicksBannerItemView: View {
    // MARK: - プロパティー
    @State private var scrollTarget: Int? = nil
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    // MARK: - ボディー

    var body: some View {
        HStack {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(TestData.shared.bannerItems, id: \.self) { item in
                            Image(item)
                                .padding(.leading, 10)
                                .id(TestData.shared.bannerItems.firstIndex(of: item))
                        }
                    }//: HStack
                    .onReceive(timer) { _ in
                        withAnimation {
                            /// 現在のターゲットを更新
                            scrollTarget = (scrollTarget ?? 0) + 1
                            if let scrollTarget = scrollTarget, scrollTarget >= TestData.shared.bannerItems.count {
                                self.scrollTarget = 0
                            }

                            /// スクロールビューを指定の位置に移動
                            proxy.scrollTo(scrollTarget, anchor: .center)
                        }
                    }//: onReceive

                }//: ScrollView

            }//: ScrollViewReader

        }//: HStack

    }//: ボディー
}

#Preview {
    TopicksBannerItemView()
}
