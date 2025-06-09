import SwiftUI

struct UserData: Codable, Identifiable, Hashable {
    let id: Int
    let firstName: String
    let lastName: String
    let age: Int
    let email: String
    let image: String
}

struct UserResponse: Codable, Hashable {
    let users: UserDatas
}

typealias UserDatas = [UserData]
