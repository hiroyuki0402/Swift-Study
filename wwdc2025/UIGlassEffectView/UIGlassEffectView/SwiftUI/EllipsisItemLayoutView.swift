import SwiftUI

struct ItemLayoutView: View {
    @Binding var isExpanded: Bool
    let items: [Items]
    let axis: DisplayAxis

    var body: some View {
        Group {
            if axis == .horizontal {
                HStack(spacing: 20) {
                    toggleButton
                        .padding(.horizontal)
                    if isExpanded {
                        itemList
                    }
                    Spacer()
                }
            } else {
                VStack(spacing: 20) {
                    Spacer()
                    if isExpanded {
                        itemList
                    }
                    toggleButton
                }
            }
        }
    }

    private var toggleButton: some View {
        Button {
            withAnimation(.smooth(duration: 1, extraBounce: 0)) {
                isExpanded.toggle()
            }
        } label: {
            Image(systemName: "ellipsis")
                .font(.title)
                .foregroundStyle(.white.gradient)
                .frame(width: 40, height: 10)
        }
        .padding()
        .padding(.bottom, 8)
        .buttonStyle(.glass)
    }

    private var itemList: some View {
        ForEach(items) { item in
            EllipsisItemView(item: item) {
                print(item.id)
            }
        }
        .glassEffect(.regular, in: .circle)
    }
}
