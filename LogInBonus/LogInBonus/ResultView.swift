import SwiftUI

struct ResultView: View {
    var body: some View {
        VStack {
            Text("🎉 当たり！")
                .font(.largeTitle)
                .padding()

            Text("おめでとうございます！")
                .padding()
        }
    }
}
#Preview {
    ResultView()
}
