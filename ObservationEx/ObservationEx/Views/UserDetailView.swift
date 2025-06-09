import SwiftUI

struct UserDetailView: View {
    let user: UserData
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: user.image)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                } else {
                    Circle()
                        .fill(.gray.opacity(0.3))
                        .frame(width: 120, height: 120)
                }
            }

            Text("\(user.firstName) \(user.lastName)")
                .font(.title)
                .fontWeight(.bold)

            Text("年齢: \(user.age)")
            Text("メール: \(user.email)")
                .foregroundColor(.blue)

            Spacer()

            Button("閉じる") {
                dismiss()
            }
            .padding(.top, 20)
        }
        .padding()
    }
}

