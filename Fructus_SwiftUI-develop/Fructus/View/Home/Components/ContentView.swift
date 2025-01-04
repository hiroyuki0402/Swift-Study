//
//  ContentView.swift
//  Fructus
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/16.
//

import SwiftUI
import CoreData

struct ContentView: View {
// MARK: -  プロパティー

    @State private var isAnimating: Bool = false

    var fruitsData: FruitsData

    // MARK: - ボディー

    var body: some View {

        ZStack {
            VStack(spacing: 20) {
                Image(fruitsData.image)
                    .resizable()
                .scaledToFit()
                .shadow(color: .black.opacity(0.15), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .scaleEffect(isAnimating ? 1.0: 0.6)

                Text(fruitsData.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: .red.opacity(2), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

                Text(fruitsData.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal ,16)
                    .frame(maxWidth: 480)

                StartButtonView()

            }//: VStack
        }//: ZStack
        .onAppear {
          withAnimation(.easeOut(duration: 0.5)) {
            isAnimating = true
          }
        }

        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)

        .background(
            LinearGradient(
                gradient: Gradient(colors: fruitsData.gradientColors),
                startPoint: .top,
                endPoint: .bottom)
        )
        .cornerRadius(20)
        .padding()
    }

    // MARK: - メソッド
}



#Preview {
    ContentView(fruitsData: FruitsViewModel().loadFruitsData(at: 0))
}
