//
//  OnboardingView.swift
//  Restart-App
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/10.
//

import SwiftUI
import AVFoundation

struct OnboardingView: View {
    // MARK: - プロパティー

    /// アプリのオンボーディングが完了したかどうかを保存および取得するためのプロパティ。
    /// `true`の場合、オンボーディングは既に表示されており、再度表示する必要ない。
    /// `false`の場合、ユーザーはまだオンボーディングを経験していない。
    @AppStorage("onboarding") var isOnboardingViewActivite: Bool = true

    @State private var buttonWidht = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var iamgeOffset: CGSize = .zero
    @State private var inddicatorOpacity: Double = 1.0
    @State private var title: String = "Share"

    let feedBack = UINotificationFeedbackGenerator()


    // MARK: - ボディー
    var body: some View {

        ZStack {
            // 背景の設定
            Color(.colorBlue)
                .ignoresSafeArea(.all, edges: .all)

            // MARK: -  メインコンテンツ
            VStack(spacing: 20) {
                Spacer()

                // MARK: -  タイトルとサブテキストのセクション
                VStack(spacing: 0) {
                    Text(title)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(title)
                    Text("私たちがどれだけ多くを与えるかではなく、与える行為にどれだけの愛を込めるかが大切です ")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                }
                .opacity(isAnimating ? 1: 0)
                .offset(y: isAnimating ? 0: -40)
                .animation(.easeOut(duration: 1 ), value: isAnimating )

                // MARK: -  キャラクターイメージのセクション
                ZStack {
                    CycleGroupView(ShapeColor: .white, ShapeOpacity: 0.4)
                        .offset(x: iamgeOffset.width * -1)
                        .blur(radius: abs(iamgeOffset.width / 5))
                        .animation(.easeInOut(duration: 1), value: iamgeOffset)

                    Image(.character1)
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1: 0)
                        .animation(.easeOut(duration: 0.5 ), value: isAnimating )
                        .offset(x: iamgeOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(iamgeOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if abs(iamgeOffset.width) <= 150 {
                                        iamgeOffset = gesture.translation
                                    }

                                    withAnimation(.linear(duration: 0.25)) {
                                        inddicatorOpacity = 0
                                        title = "Give"
                                    }
                                })

                                .onEnded({ gesuture in
                                    iamgeOffset = .zero

                                    withAnimation(.linear(duration: 0.25)) {
                                        inddicatorOpacity = 1
                                        title = "Share"
                                    }
                                })
                        )
                        .animation(.easeInOut(duration: 1), value: iamgeOffset)
                }
                .overlay(
                Image(systemName: "arrow.left.and.right.circle")
                    .font(.system(size: 40, weight: .ultraLight))
                    .foregroundColor(.white)
                    .offset(y: 20)
                    .opacity(isAnimating ? 1: 0)
                    .animation(.easeInOut(duration: 1).delay(2), value: isAnimating)
                    .opacity(inddicatorOpacity),
                alignment: .bottom

                )


                Spacer()

                // MARK: -  "始めましょう"ボタンのセクション
                ZStack {
                    Capsule()
                        .fill(.white.opacity(0.2))

                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)

                    Text("始めましょう")
                        .font(.title3)
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    HStack {
                        Capsule()
                            .fill(.red)
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }

                    HStack {
                        ZStack {
                            Capsule()
                                .fill(.red)

                            Capsule()
                                .fill(.black.opacity(0.15))
                                .padding(8)

                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    let isTransion = gesture.translation.width > 0 && buttonOffset <= buttonWidht - 80
                                    if isTransion {
                                        buttonOffset = gesture.translation.width
                                    }
                                    print(gesture.location.x)
                                }
                                .onEnded { gesture in
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if buttonOffset > buttonWidht / 2 {
                                            feedBack.notificationOccurred(.success)
                                            buttonOffset = buttonWidht - 80
                                            isOnboardingViewActivite = false
                                           playSound(sound: "chimeup", type: "mp3")
                                        } else {
                                            feedBack.notificationOccurred(.warning)
                                            buttonOffset = 0
                                        }
                                    }

                                }
                        )
                        Spacer()
                    }

                }
                .frame(width: buttonWidht,height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1: 0)
                .offset(y: isAnimating ? 0: 40)
                .animation(.easeOut(duration: 1 ), value: isAnimating )



            }//: VStack
        } //: ZStack
        .onAppear(perform: {
            isAnimating = true
        })
        .preferredColorScheme(.dark)
    }

    // MARK: - メソッド
}

// プレビュー用のセクション
#Preview {
    OnboardingView()
}
