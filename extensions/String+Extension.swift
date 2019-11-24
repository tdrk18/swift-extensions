//
//  String+Extension.swift
//  extensions
//
//  Created by shota_todoroki on 2018/01/21.
//  Copyright © 2018年 shota_todoroki. All rights reserved.
//

import Foundation

public extension String {

    var isNotEmpty: Bool {
        !isEmpty
    }

    func trimmedWhiteSpace() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }

    func hasOnlyWhiteSpace() -> Bool {
        return self.trimmedWhiteSpace() == ""
    }

}
