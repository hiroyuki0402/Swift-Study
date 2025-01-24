//
//  NotificationDeepLinkingApp.swift
//  NotificationDeepLinking
//
//  Created by SHIRAISHI HIROYUKI on 2025/01/23.
//

import SwiftUI

@main
struct NotificationDeepLinkingApp: App {
    /// アプリ全体のデータを管理するAppDataを使う
    @UIApplicationDelegateAdaptor(AppData.self) private var appData
    var body: some Scene {
        WindowGroup {
            ContentView()
                /// AppDataを環境変数としてセットしてる
                .environment(appData)

                /// URLスキームでアプリが開かれたときに処理する
                .onOpenURL { url in
                    if let urlHost = url.host() {
                        print(urlHost)
                    }
                }
        }
    }
}

// MARK: -

@Observable
class AppData: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    /// 画面遷移のためのパスを保持する配列
    var mainPageNavbigationPath: [String] = []

    /// アプリ起動時の初期設定
    /// - Parameters:
    ///   - application: UIApplicationインスタンス
    ///   - launchOptions: 起動時のオプション
    /// - Returns: 起動成功かどうか
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        /// 通知のデリゲートを設定してる
        UNUserNotificationCenter.current().delegate = self
        return true
    }

    /// 通知がアクティブ状態で来たときに処理する
    /// - Parameters:
    ///   - center: 通知センター
    ///   - notification: 通知の内容
    /// - Returns: 表示方法（バナーとサウンド）
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        return [.banner, .sound]
    }

    /// 通知をタップしてアプリが開かれたときの処理
    /// - Parameters:
    ///   - center: 通知センター
    ///   - response: 通知に対するレスポンス
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        /// 通知情報からリンクを取得
        if let pageLink = response.notification.request.content.userInfo["pagelink"] as? String {
            /// 最後のパスと違えば追加する
            if mainPageNavbigationPath.last != pageLink {
                mainPageNavbigationPath.append(pageLink)
            }
            /// リンクがURL形式じゃなければ何もしない
            guard let url = URL(string: pageLink) else { return }

            /// 外部ブラウザでリンクを開く
            UIApplication.shared.open(url, options: [:]) { _ in
                // TODO: 必要なら後で処理追加する
            }
        }
    }
}
