import SwiftUI

struct ContentView: View {
    private let color = #colorLiteral(red: 0.1254901961, green: 0.7882352941, blue: 0.5921568627, alpha: 1)
    private let gray = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    private let backgroundColor = Color(red: 0.125, green: 0.788, blue: 0.592)

    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()

            VStack {
                Image("IMG_2075")
                    .frame(width: 200, height: 200)
                    .cornerRadius(100)
                    .scaledToFit()

                Text("HIROYUKI SHIRAISHI")
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundColor(.white)

                Text("iOS Engineer")
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundColor(Color(gray))

                VStack(spacing: 10) {
                    HStack {
                        Spacer(minLength: 20)
                        HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(Color(color))
                                .frame(width: 50, height: 50)
                                .background(Color.white)
                                .cornerRadius(25) // コーナーラディウスを適用
                            Text("TextAbcd@gmail.com")
                                .frame(height: 50)
                                .foregroundColor(Color(color))
                            Spacer()
                        }
                        .padding(5) // HStack全体に余白を追加
                        .background(Color.white.cornerRadius(25)) // HStack全体にコーナーラディウスを適用
                        Spacer(minLength: 20)
                    }

                }
                .padding(.top, 10)

                VStack(spacing: 10) {
                    HStack {
                        Spacer(minLength: 20)
                        HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(Color(color))
                                .frame(width: 50, height: 50)
                                .background(Color.white)
                                .cornerRadius(25) // コーナーラディウスを適用
                            Text("TextAbcd@gmail.com")
                                .frame(height: 50)


                            Spacer()
                        }
                        .padding(5) // HStack全体に余白を追加
                        .background(Color.white.cornerRadius(25)) // HStack全体にコーナーラディウスを適用
                        Spacer(minLength: 20)
                    }

                }
                .padding(.top, 10)
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
