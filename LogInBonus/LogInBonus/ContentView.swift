//
//  ContentView.swift
//  LogInBonus
//
//  Created by SHIRAISHI HIROYUKI on 2025/04/07.
//

import SwiftUI

struct ContentView: View {

    @State private var selectedType: LogBonusType?

    var body: some View {
        NavigationStack {
            List {
                ForEach(LogBonusType.allCases) { type in
                    Button {
                        selectedType = type
                    } label: {
                        Text(type.title)
                            .foregroundStyle(.gray)
                            .bold()
                    }
                }
            }
            .navigationDestination(item: $selectedType) { type in
                logBonusDestination(for: type)
            }
            .navigationTitle("ログインボーナス一覧")
        }
    }

    @ViewBuilder
    private func logBonusDestination(for type: LogBonusType) -> some View {
        switch type {
        case .patternA:
            LoginBonusViewA()

        case .patternAUIKIt:
            LoginBonusViewControllerWrapper()
        }
    }
}

#Preview {
    ContentView()
}

enum LogBonusType: String, CaseIterable, Identifiable {
    case patternA
    case patternAUIKIt

    var id: Self { self }

    var title: String {
        switch self {
        case .patternA:
            return "patternA SwiftUIで作成"
        case .patternAUIKIt:
            return "patternA SwiftUIKitで作成"
        }
    }
}
