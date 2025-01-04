//
//  HomeView.swift
//  Restart-App
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/10.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    // MARK: - プロパティー

    /// アプリのオンボーディングが完了したかどうかを保存および取得するためのプロパティ。
    /// `true`の場合、オンボーディングは既に表示されており、再度表示する必要はありません。
    /// `false`の場合、ユーザーはまだオンボーディングを経験していません。
    @AppStorage("onboarding") var isOnboardingViewActivite: Bool = false

    @State private var isAnimating: Bool = false
    let feedBack = UINotificationFeedbackGenerator()

    // MARK: - ボディー
    var body: some View {


        VStack(spacing: 20) {
            Spacer()

            // MARK: - ヘッダー
            ZStack {
                CycleGroupView(ShapeColor: .gray, ShapeOpacity: 0.2)

            Image(.character2)
                .resizable()
                .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35: -100)
                .animation(
                    Animation
                        .easeInOut(duration: 4)
                        .repeatForever(),
                        value: isAnimating
                    )
            }
            // MARK: - センター

            Text("習得にかかる時間は、我々の集中力の度合いに左右される。")
                .font(.title3)
                .fontWeight(.light)
                .padding()
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)

            // MARK: - フッター


            Button {
                withAnimation {
                    feedBack.notificationOccurred(.success)
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActivite = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.doc.on.clipboard")
                    .imageScale(.large)

                Text("REStart")
                    .font(.title3)
                    .fontWeight(.bold)

            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    isAnimating = true
                })
            })


        } //: VStack
    }

    // MARK: - メソッド
}

#Preview {
    HomeView()
}
