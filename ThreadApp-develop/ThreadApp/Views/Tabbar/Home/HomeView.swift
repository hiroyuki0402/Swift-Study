//
//  HomeView.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/17.
//

import SwiftUI

struct HomeView: View {
    // MARK: - プロパティー
    @StateObject var homeViewmodel = HomeViewModel()
    // MARK: - ボディー
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                ForEach( homeViewmodel.thredDats) { item in
                    ThreadListViewItem(threadData: item)
                }
            }//: ScrollView
            .refreshable {
                print("ssss")
            }
            .navigationTitle("Thred")
            .navigationBarTitleDisplayMode(.inline)
        }//: NavigationStack
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                navigationBarTrailingItem
            }
        }
    }//: ボディー
}

// MARK: - HomeViewアイテム

private extension HomeView {

    // MARK: - セル
    /// セル
    private var cell: some View {
        ForEach(homeViewmodel.thredDats) { item in
            LazyVStack {
                ThreadListViewItem(threadData: item)
            }
        }
    }

    // MARK: - BarbuttonItem

    /// 右側のアイテム
    private var navigationBarTrailingItem: some View {
        refresh
    }

    /// リロード
    private var refresh: some View {
        Button{

        } label: {
           Image(systemName: "arrow.counterclockwise")
                .foregroundColor(.black)
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
