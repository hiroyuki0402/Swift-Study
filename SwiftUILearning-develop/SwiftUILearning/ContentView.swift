//
//  ContentView.swift
//  SwiftUILearning
//
//  Created by SHIRAISHI HIROYUKI on 2023/04/08.
//

import SwiftUI


struct ContentView: View {


    /// Listのタイトル取得
    /// - Parameter index: 取得する番号
    /// - Returns: タイトル
    func title(index: Int) -> String {
        guard let title = LearningItme(rawValue: index)?.title() else { return "" }
        return title
    }

    /// 画面遷移先の取得
    /// - Parameter index: 遷移するインデックス
    /// - Returns: 画面名
    func destination(index: Int) -> AnyView {
        if let view = LearningItme(rawValue: index)?.destination() {
            return AnyView(view)
        }
        return AnyView(self)
    }

    /**
     someについて
     Opaque Result Type
     [SwiftUI を理解するために必要な Swift 5.1 の新機能 (some View編)](https://speakerdeck.com/kumamotone/swiftui-woli-jie-surutamenibi-yao-na-swift-5-dot-1-falsexin-ji-neng-some-viewbian)
     */
    var body: some View {
        NavigationStack {
                List(0..<LearningItme.allCases.count, id: \.self) { index in
                    NavigationLink(destination: destination(index: index)) {
                        Text(title(index: index))
                }
            }
                .navigationTitle("Navihgation")
                .navigationBarTitleDisplayMode(.inline)
        }

    }
}


/// プレビューの表示設定を行うところ
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum LearningItme: Int, CaseIterable {
    case helloWord
    case countup
    case todo
    case api
    case firebase
    case map
    case camera
    case chat

    /// タイトル
    /// - Returns: タイトル
    func title() -> String {
        switch self {
        case .helloWord:
            return "~HelloWorld~を色々変えてみる"
        case .countup:
            return "カウントアップ機能作ってみる"
        case .todo:
            return "TODOアプリを作ってみる"
        case .api:
            return "GithubのAPIを用いて通信を行ってみる"
        case .firebase:
            return "FireBaseを導入してログイン画面を作ってみる"
        case .map:
            return "マップ機能に関する画面を作ってみる"
        case .camera:
            return "写真や動画のカメラ機能を作ってみる"
        case .chat:
            return "チャットアプリを作ってみる"
        }
    }
        /// 遷移先
        /// - Returns: 遷移先のファイル名
    func destination() -> any View {
            switch self {
            case .helloWord:
                return HelloWordView()
            case .countup:
                return CountUpView()
            case .todo:
                return TODOView()
            case .api:
                return APIView()
            case .firebase:
                return FireBaseView()
            case .map:
                return MapView()
            case .camera:
                return CameraView()
            case .chat:
                return ChatView()
            }
        }
    }

