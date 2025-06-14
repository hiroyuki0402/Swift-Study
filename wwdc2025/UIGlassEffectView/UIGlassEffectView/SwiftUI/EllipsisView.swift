import SwiftUI

struct EllipsisView: View {
    let items: [Items]
    var axis: DisplayAxis = .vertical

    @State private var isExpanded = false

    var body: some View {
        ZStack {
            Image(.bg)
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                .clipShape(.rect(cornerRadius: 20))
                .overlay(alignment: .bottom) {
                    GlassEffectContainer(spacing: 20) {
                        ItemLayoutView(
                            isExpanded: $isExpanded,
                            items: items,
                            axis: axis
                        )
                    }
                }
        }
        .padding()
    }
}

enum DisplayAxis {
    case horizontal
    case vertical
}

enum Items: String, CaseIterable, Identifiable {
    case heart
    case search

    var id: String { rawValue }

    var systemImageName: String {
        switch self {
        case .heart: return "heart"
        case .search: return "magnifyingglass"
        }
    }

    var color: Color {
        switch self {
        case .heart: return .red
        case .search: return .white
        }
    }
}

#Preview {
    EllipsisView(items: Items.allCases)
}
