import Observation
import Foundation

@Observable
class UserListViewModel {
    private(set) var userResponse: UserResponse?
    private(set) var isLoading = false
    private(set) var errorMessage: String?

    func fetchUsers() async {
        
        isLoading = true
        errorMessage = nil

        defer { isLoading = false }

        let sampleUrlString = "https://dummyjson.com/users"

        do  {
            let url = URL(string: sampleUrlString)
            let response: UserResponse = try await APIManager.shared.call(url, type: UserResponse.self)
            self.userResponse = response
        } catch {
            errorMessage = error.localizedDescription
        }

    }
}
