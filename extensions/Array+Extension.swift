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
