//
//  Int+Extension.swift
//  extensions
//
//  Created by shota_todoroki on 2018/01/08.
//  Copyright © 2018 shota_todoroki. All rights reserved.
//

import Foundation

public extension Int {

    var isEven: Bool {
        return self % 2 == 0
    }

    var formattedStringWithComma: String {
        return formattedString(style: .decimal, localeIdentifier: "ja_JP")
    }

    // MARK: - methods
    private func formattedString(style: NumberFormatter.Style, localeIdentifier: String) -> String {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = style
        formatter.locale = Locale(identifier: localeIdentifier)
        return formatter.string(from: self as NSNumber) ?? ""
    }

}
