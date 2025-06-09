import SwiftUI

struct LoadingView: View {
    var scaleEffect: CGFloat = 1.5
    var foregroundColor: Color = .gray
    var bgcolor: Color = .init(uiColor: .systemBackground)
    var bgcolorOpacity: Double = 0.7
    var loadingText: String = "読み込み中…"

    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(scaleEffect)
                .padding()
            Text(loadingText)
                .font(.caption)
                .foregroundColor(foregroundColor)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(bgcolor.opacity(bgcolorOpacity))
    }
}
