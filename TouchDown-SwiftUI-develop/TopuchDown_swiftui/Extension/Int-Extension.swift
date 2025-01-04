//
//  Int-Extension.swift
//  TopuchDown_swiftui
//
//  Created by SHIRAISHI HIROYUKI on 2023/10/31.
//

import Foundation

extension Int {
    func toString() -> String {
        return String(self)
    }

    func numberWidthComma() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        if let result = formatter.string(from: NSNumber(value: self)) {
            return result
        } else {
            return ""
        }
    }
}
