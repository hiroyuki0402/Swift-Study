//
//  ContentView.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/17.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - プロパティー
    @StateObject var contentViewModel = ContentViewModel()

    // MARK: - ボディー
    var body: some View {
        Group {

            if let _ = contentViewModel.userSection {
                /// ログインしていれば
                MainTabView()
            } else {
                /// ログインしていない場合
                LoginView()
            }
        }//: Group

    }//: ボディー
}

#Preview {
    ContentView()
}
