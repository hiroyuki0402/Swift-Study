import SwiftUI
import Lottie

struct LoginBonusViewA: View {

    @StateObject private var bonusManager = LoginBonusManagerA()
    @State private var animateStamp = false

    private let totalDaysInMonth = Calendar.current.range(of: .day, in: .month, for: Date())?.count ?? 30
    private let currentMounth = Calendar.current.component(.month, from: Date())

    var currentRank: String {
        switch (bonusManager.consecutiveDays - 1) / 7 {
        case 0: return "ブロンズ"
        case 1: return "シルバー"
        case 2: return "ゴールド"
        default: return "プラチナ"
        }
    }

    var currentRankColor: Color {
        switch (bonusManager.consecutiveDays - 1) / 7 {
        case 0: return .brown
        case 1: return .gray
        case 2: return .yellow
        default: return .purple
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {

                /// テスト用スタンプ増加ボタン
                Button("テスト用スタンプ増加") {
                    if bonusManager.consecutiveDays < totalDaysInMonth {
                        bonusManager.consecutiveDays += 1
                        animateStamp = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                            animateStamp = false
                        }
                    }
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)

                /// 現在のランク
                Text("現在のランク：\(currentRank)")
                    .font(.title2)
                    .bold()
                    .foregroundColor(currentRankColor)
                    .padding(.top)

                /// ボーナスメッセージ
                Text("\(currentMounth)月ログインボーナス")
                    .font(.largeTitle)
                    .bold()

                Text(bonusManager.message)
                    .font(.title3)
                    .foregroundColor(.green)
                    .padding(.bottom)

                /// スタンプグリッド（月末日数まで）
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 7), spacing: 16) {
                    ForEach(1...totalDaysInMonth, id: \.self) { day in
                        let isCompleted = day <= bonusManager.consecutiveDays
                        let isRankDay = day % 7 == 0
                        let showAnimation = day == bonusManager.consecutiveDays && animateStamp
                        let rank = rankInfo(for: day)
                        let stampColor: Color = isRankDay && bonusManager.consecutiveDays >= day
                            ? rank.color
                            : (isCompleted ? .yellow : .gray)

                        VStack {
                            StampView(
                                day: day,
                                isCompleted: isCompleted,
                                showAnimation: showAnimation,
                                stampColor: stampColor
                            )

                            if isRankDay {
                                let rank = rankLabel(for: day)
                                Text(rank.label)
                                    .font(.caption2)
                                    .foregroundColor(rank.color)
                                    .bold()
                            }
                        }
                    }
                }
                .padding()

                /// OKボタン（ログイン処理）
                Button(action: {
                    bonusManager.checkLogin()
                    animateStamp = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        animateStamp = false
                    }
                }) {
                    Text("OK")
                        .frame(minWidth: 100)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 10)
            }
            .padding()
        }
    }

    /// ランク名ラベル
    private func rankLabel(for day: Int) -> (label: String, color: Color) {
        switch (day - 1) / 7 {
        case 0: return ("ブロンズ", .brown)
        case 1: return ("シルバー", .gray)
        case 2: return ("ゴールド", .yellow)
        default: return ("プラチナ", .purple)
        }
    }

    private func rankInfo(for day: Int) -> (label: String, color: Color) {
        switch (day - 1) / 7 {
        case 0: return ("ブロンズ", .brown)
        case 1: return ("シルバー", .gray)
        case 2: return ("ゴールド", .yellow)
        default: return ("プラチナ", .purple)
        }
    }
}

#Preview {
    LoginBonusViewA()
}

struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode = .loop

    func makeUIView(context: Context) -> UIView {
        let container = UIView()
        container.backgroundColor = .clear

        let animationView = LottieAnimationView(name: name)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()

        container.addSubview(animationView)

        // ★ SwiftUIの .frame を正しく受け取るための制約
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: container.topAnchor),
            animationView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            animationView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: container.trailingAnchor)
        ])

        return container
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct StampView: View {
    let day: Int
    let isCompleted: Bool
    let showAnimation: Bool
    let stampColor: Color
    var offset: CGFloat = 100
    @State private var pressed = false
    @State private var bounceOffset: CGFloat = 0

    var body: some View {
        VStack(spacing: 4) {
            ZStack {
                Image(systemName: isCompleted ? "gift.fill" : "gift")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(isCompleted ? stampColor : .gray)
                    .scaleEffect(pressed ? 0.85 : 1.0)       // 押し込まれる
                    .offset(y: pressed ? 3 : 0)              // 少し下がる
                    .animation(.interpolatingSpring(stiffness: 200, damping: 5), value: pressed)
                    .overlay(
                        Group {
                            if showAnimation {
                                LottieView(name: "stamp", loopMode: .playOnce)
                                    .frame(width: 450, height: 450)
                                    .offset(y: -bounceOffset)
                            }
                        }
                    )
            }

            Text("\(day)日")
                .font(.caption)
        }
        .onChange(of: showAnimation) { oldValue, newValue in
            if newValue {
                // 押し込みアニメーション開始
                pressed = true
                if newValue {
                    performBounce()
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    pressed = false

                }
            }
        }
        .frame(height: 50) // ← 高さ固定して揺れを防ぐ（必要なら）
    }

    private func performBounce() {
        bounceOffset = 80  // 上にポン
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            bounceOffset = 60  // 下にストン
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                bounceOffset = 100  // 元の位置に戻る
            }
        }
    }
}

