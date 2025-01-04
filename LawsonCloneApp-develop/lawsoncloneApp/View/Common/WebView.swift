//
//  WebView.swift
//  lawsoncloneApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/12/09.
//

import SwiftUI
import WebKit


class WebViewState: ObservableObject {

    /// WKWebViewのインスタンスを保持する
    @Published var webView: WKWebView?

    init() {
        let configuration = WKWebViewConfiguration()
        /// インラインでのメディア再生を許可する設定
        configuration.allowsInlineMediaPlayback = true
        self.webView = WKWebView(frame: .zero, configuration: configuration)
    }
}

struct WebView: UIViewRepresentable {
    var state: WebViewState
    /// WebViewがロードするWebページのURL
    let url: URL

    /// SwiftUIビューが生成されるときにWKWebViewを作成
    /// - Parameter context: UIViewRepresentableのコンテキスト情報
    /// - Returns: 新しく作成されたWKWebViewインスタンス
    func makeUIView(context: Context) -> WKWebView {
        if let webView = state.webView {
            return webView
        }
        return WKWebView(frame: .zero)
    }

    /// SwiftUIビューの状態が更新されたときに呼ばれる関数
    /// - Parameters:
    ///   - uiView: 更新されるWKWebViewインスタンス
    ///   - context: UIViewRepresentableのコンテキスト情報
    func updateUIView(_ uiView: WKWebView, context: Context) {
        /// 指定されたURLからWebページをロード
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct WebViewContainer: View {
    /// 現在のビューの表示状態
    @Environment(\.presentationMode) var presentationMode

    /// ロードするWebページのURL
    let url: URL

    /// WebViewの状態を管理するためのStateObject
    @StateObject private var webViewState = WebViewState()

    var body: some View {
        NavigationView {
            WebView(state: webViewState, url: url)
                .navigationBarTitle("WebView", displayMode: .inline)
                .navigationBarItems(
                    leading: Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("戻る")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                    })
        }
    }
}

