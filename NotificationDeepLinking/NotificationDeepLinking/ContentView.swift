import SwiftUI

struct ContentView: View {
    /// アプリ全体の状態管理
    @Environment(AppData.self) private var appData

    var body: some View {
        /// appDataを双方向バインドで使えるようにしてる
        @Bindable var appData = appData

        NavigationStack(path: $appData.mainPageNavbigationPath) {
            List {
                NavigationLink("サンプル1", value: "sample1")
                NavigationLink("サンプル2", value: "sample2")
                NavigationLink("サンプル3", value: "sample3")
            }
            .navigationTitle("プッシュ通知のディープリンクテスト")
            .navigationDestination(for: String.self) { value in
                Text("画面遷移：\(value)")
                    .navigationTitle(value)
            }
        }
        /// 初期タスクとして通知の権限リクエストをしてる
        .task {
            let _ = try? await
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound])
        }
    }
}

#Preview {
    ContentView()
}
