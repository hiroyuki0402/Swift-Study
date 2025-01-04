//
//  ContentView.swift
//  Africa_SwiftUI
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/22.
//

import SwiftUI
import CoreData

enum ShowMode: Int {
    case gridOneRows
    case gridTwoRows
    case gridThreeRows
}

struct ContentView: View {

    // MARK: - プロパティー

    /// ワイルドアニマルの情報を管理するViewModel。
    let animalsViewModel = AnimalsViewModel()

    /// カバーイメージに関する情報を管理するViewModel。
    let coverImageViewModel = CoverImageViewModel()

    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn: Int = 2
    @State private var toolbarIcon: String = "square.grid.2x2"
    @State private var mode: ShowMode = .gridTwoRows

    let haptics = UIImpactFeedbackGenerator(style: .medium)

    // MARK: - Body セクション

    var body: some View {
        /// NavigationViewを使用して、リストを含む画面を表示
        NavigationView {

            Group {
                /// アニマルのリストを表示
                if !isGridViewActive {
                    List {
                        /// ヘッダとしてカバーイメージを表示
                        CoverImageView(coverImageData: coverImageViewModel.coverImageDatas)
                            .scaledToFill()
                            .frame(height: 300)
                            .listRowInsets(
                                EdgeInsets(
                                    top: 0,
                                    leading: 0,
                                    bottom: 0,
                                    trailing: 0))

                        /// 各アニマルのデータをループして、リストアイテムとして表示
                        ForEach(animalsViewModel.animalDatas) { data in
                            /// アニマルの詳細画面へのナビゲーションリンク
                            NavigationLink(destination: AnimalDetailView(animalData: data)) {
                                /// アニマルのリストアイテムを表示
                                AnimalListItemView(animalsData: data)
                            }
                        }
                    }//: LIst
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animalsViewModel.animalDatas) { item in
                                NavigationLink(destination: AnimalDetailView(animalData: item)) {
                                    AnimalGridItemView(animalsData: item)
                                }//: NavigationLink
                            }//: ループ
                        }//: LazyVGrid
                        .padding(10)

                    }//: ScrollView
                }//: if isGridViewActive
            }//: Group
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {

                        /// リストタイプ
                        Button(action: {
                            isGridViewActive = false
                            haptics.impactOccurred()
                            resetGrid()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        })

                        /// グリッドタイプ
                        Button(action: {
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }) {
                            Image(systemName: toolbarIcon)
                              .font(.title2)
                              .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                        .frame(width: 30)
                    }

                }
            }//: ToolbarItem

        }//: NavigationView
    }

    func gridSwitch() {

      // TOOLBAR IMAGE

        switch mode {
        case .gridOneRows:
            toolbarIcon = "square.grid.2x2"
            mode = .gridTwoRows
            gridColumn = 1
        case .gridTwoRows:
            toolbarIcon = "square.grid.3x2"
            mode = .gridThreeRows
            gridColumn = 2
        case .gridThreeRows:
            toolbarIcon = "rectangle.grid.1x2"
            mode = .gridOneRows
            gridColumn = 3
        }

        gridLayout = Array(repeating: .init(.flexible()), count: gridColumn)
      print("Grid Number: \(gridColumn)")
    }

    func resetGrid() {
        toolbarIcon = "square.grid.2x2"
        mode = .gridTwoRows
    }
}


#Preview {
    ContentView()
}
