//
//  SearchView.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/17.
//

import SwiftUI

struct SearchView: View {
    // MARK: - プロパティー
    @State private var searchText: String = ""
    @StateObject var exprolerViewModel = ExprolerViewModel()

    // MARK: - ボディー
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(exprolerViewModel.users) { item in
                        NavigationLink(value: item) {
                            VStack {
                                SearchListItemView(userData: item)
                            }
                        }//: NavigationLink
                    }//: ループ
                }//: LazyVStack
            }//: ScrollView
            .navigationDestination(for: UserData.self, destination: { user in
                ProfileView(userData: user)
            })
            .searchable(text: $searchText, prompt: "Search")
            .navigationTitle("Search")
        }//: NavigationStack
    }//: ボディー
}

private extension SearchView {

}

#Preview {
    SearchView()
}
