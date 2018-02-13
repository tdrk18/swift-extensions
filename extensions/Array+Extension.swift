//
// Created by shota_todoroki on 2018/01/21.
// Copyright (c) 2018 shota_todoroki. All rights reserved.
//

import Foundation

public extension Array where Element == Int {

    func sortAsc() -> Array {
        return self.sorted { $0 < $1 }
    }

    func sortDesc() -> Array {
        return self.sorted { $0 > $1 }
    }

}

public extension Array where Element: Equatable {

    mutating func removeFirst(element: Element) {
        if let index: Int = self.index(of: element) {
            self.remove(at: index)
        }
    }

    mutating func remove(element: Element) {
        if let index: Int = self.index(of: element) {
            self.remove(at: index)
            self.remove(element: element)
        }
    }

    mutating func unique() {
        self = reduce(into: []) {
            if !$0.contains($1) {
                $0.append($1)
            }
        }
    }

}
