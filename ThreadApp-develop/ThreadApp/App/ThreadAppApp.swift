//
//  ThreadAppApp.swift
//  ThreadApp
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/17.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

      /// ファーヤーベース
      configureFireBase()

    return true
  }
}

@main
struct ThreadAppApp: App {
    // MARK: - プロパティー

    /// アプリデリゲートをUIAppDelegateAdaptorとして接続
    /// これにより、AppDelegateを使って従来のUIKitのライフサイクルイベントを処理が可能
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    // MARK: - ボディー

    /// アプリのメインビューを定義
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }//: ボディー
}

// MARK: - AppDelegateで呼び出すメソッド

extension AppDelegate {

    // MARK: - FIre Base
    
    /// ファイアーベースに関する初期化等のメソッド
    func configureFireBase() {
        FirebaseApp.configure()
    }
}
