//
//  Date+Extension.swift
//  extensions
//
//  Created by shota_todoroki on 2018/01/16.
//  Copyright © 2018 shota_todoroki. All rights reserved.
//

import Foundation

let formatter: DateFormatter = {
    let formatter: DateFormatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.calendar = Calendar(identifier: .gregorian)
    return formatter
}()

public extension Date {

    func string(format: String = "") -> String {
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    init?(dateString: String, dateFormat: String = "") {
        if let timezone: TimeZone = NSTimeZone.init(abbreviation: "UTC") as TimeZone? {
            formatter.timeZone = timezone
        }
        formatter.dateFormat = dateFormat
        guard let date: Date = formatter.date(from: dateString) else { return nil }
        self = date
    }

}
