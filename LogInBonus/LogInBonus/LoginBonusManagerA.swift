import Foundation

class LoginBonusManagerA: ObservableObject {
    @Published var consecutiveDays: Int = 1
    @Published var bonusGivenToday: Bool = false
    @Published var message: String = ""

    private let userDefaults = UserDefaults.standard
    private let lastLoginKey = "lastLoginDate"
    private let consecutiveKey = "consecutiveLoginDays"

    init() {
        checkLogin()
    }

    func checkLogin() {
        let today = Calendar.current.startOfDay(for: Date())
        let lastLogin = userDefaults.object(forKey: lastLoginKey) as? Date ?? Date.distantPast

        /// 連続ログインチェック
        if Calendar.current.isDate(today, inSameDayAs: lastLogin) {
            /// すでに今日ログイン済
            self.bonusGivenToday = true
            self.message = "今日のボーナスは受け取り済み！"
        } else {
            /// 前回が昨日なら連続日数+1
            if Calendar.current.isDate(today.addingTimeInterval(-86400), inSameDayAs: lastLogin) {
                consecutiveDays = userDefaults.integer(forKey: consecutiveKey) + 1
            } else {
                consecutiveDays = 1
            }

            /// 保存
            userDefaults.set(today, forKey: lastLoginKey)
            userDefaults.set(consecutiveDays, forKey: consecutiveKey)

            self.bonusGivenToday = false
            self.message = "ログインボーナス獲得！"
        }
    }
}
