import SwiftUI

struct UserRowView: View {
    let user: UserData

    var body: some View {
        HStack {
            userImageView()
            userInfoView()
            Spacer()
        }
        .padding(.vertical, 4)
    }

    private func userImageView() -> some View {
        AsyncImage(url: URL(string: user.image)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } else {
                Circle()
                    .fill(.gray.opacity(0.3))
                    .frame(width: 50, height: 50)
            }
        }
    }

    private func userInfoView() -> some View {
        VStack(alignment: .leading) {
            Text("\(user.firstName) \(user.lastName)")
                .font(.headline)
            Text(user.email)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
