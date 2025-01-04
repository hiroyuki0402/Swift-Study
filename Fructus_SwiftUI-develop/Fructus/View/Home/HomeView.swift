//
//  HomeView.swift
//  Fructus
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/22.
//

import SwiftUI

struct HomeView: View {
    var viewModel = FruitsViewModel()

    @State private var isShowingSettings: Bool = false

    var body: some View {
        NavigationView {
                List {
                    ForEach(viewModel.fruitsDatas) { fruits in

                        NavigationLink(destination: DetailView(fruitsData: fruits)) {
                            FruitRowView(fruitsData: fruits)
                                .frame(height: 70)
                                .padding(.horizontal, 4)
                                .padding(.vertical, 4)

                        }
                        .listRowSeparator(/*@START_MENU_TOKEN@*/.visible/*@END_MENU_TOKEN@*/)
                    }
                }
                .navigationTitle("フルーツ")
                .navigationBarItems(
                  trailing:
                    Button(action: {
                      isShowingSettings = true
                    }) {
                      Image(systemName: "slider.horizontal.3")
                    } //: BUTTON
                    .sheet(isPresented: $isShowingSettings) {
                      SettingsView()
                    }
                )
        } //: ナビゲーション
        .listStyle(.plain)
        .navigationViewStyle(.stack)
    }
}

#Preview {
    HomeView()
}

