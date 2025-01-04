//
//  PersonData.swift
//  Pridicate_Macro
//
//  Created by SHIRAISHI HIROYUKI on 2023/09/25.
//

import Foundation

// MARK: - Person
struct Person: Codable {
    let success: Bool
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    
    let name, note: String
    let age: Int
    let registerDate: String
}
