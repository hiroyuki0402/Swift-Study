import SwiftUI

struct EllipsisItemView: View {
    let item: Items

    var didTap: (() -> Void)?

    var body: some View {
        Button {
            if let didTap {
                didTap()
            }
        } label: {
            Image(systemName: item.systemImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(10)
                .foregroundStyle(item.color.gradient)
                .accessibilityLabel(Text(item.rawValue.capitalized))
        }
    }
}
