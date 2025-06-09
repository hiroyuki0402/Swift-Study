import SwiftUI

struct UserListView: View {

    @State var viewModel: UserListViewModel = .init()
    @State var selectedUser: UserData?

    var body: some View {
        NavigationStack {
            ScrollView {
                /// ローディング
                if viewModel.isLoading {
                    LoadingView()
                } else if let viewModelError = viewModel.errorMessage {
                    Text(viewModelError)
                } else {
                    ForEach(viewModel.userResponse?.users ?? []) { user in
                        LazyVStack {
                            Button {
                                selectedUser = user
                            } label: {
                                UserRowView(user: user)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("ユーザー一覧")
        .task {
            await viewModel.fetchUsers()
        }
        .fullScreenCover(item: $selectedUser) { user in
            UserDetailView(user: user)
        }
        .padding(.top)
    }
}
