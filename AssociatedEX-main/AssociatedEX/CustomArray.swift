//
//  CustomArray.swift
//  AssociatedEX
//
//  Created by SHIRAISHI HIROYUKI on 2023/03/06.
//

import Foundation


protocol Appendble: AnyObject {
    associatedtype Item
    var colllection: [Item] { get set}
    func append(item: Item)
}

class CustomArray<T>: Appendble {
    typealias Item = T
    var colllection: [T] = []
    func append(item: T) {
        self.colllection.append(item)
    }
}
