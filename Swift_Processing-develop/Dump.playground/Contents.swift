import UIKit

struct User {
    let name: Name0
    let age: Int
    let gender: Int
}

struct Name0 {
    let firstName: Name1
    let lastName: String
}

struct Name1 {
    let firstName: Name2
    let lastName: String
}

struct Name2 {
    let firstName: Name3
    let lastName: String
}

struct Name3 {
    let firstName: String
    let lastName: String
}

let user = User(name: .init(firstName: .init(firstName: .init(firstName: .init(firstName: "HIROYUKI", lastName: "SHIRAISHI0"), lastName: "SHIRAISHI1"), lastName: "SHIRAISHI2"), lastName: "SHIRAISHI3"), age: 33, gender: 1)


print("----------------------print S-----------------")
print(user)
print("----------------------print E-----------------")

print("----------------------dump S-----------------")
dump(user)
print("----------------------dump E-----------------")
