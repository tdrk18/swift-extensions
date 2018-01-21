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
    if let timezone: TimeZone = NSTimeZone.init(abbreviation: "UTC") as TimeZone? {
        formatter.timeZone = timezone
    }
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.calendar = Calendar(identifier: .gregorian)
    return formatter
}()

public extension Date {

    func string(format: String) -> String {
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    func string(format: String, formatter: DateFormatter) -> String {
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    init?(dateString: String, dateFormat: String = "") {
        formatter.dateFormat = dateFormat
        guard let date: Date = formatter.date(from: dateString) else { return nil }
        self = date
    }

    func isoString() -> String {
        let dateFormat: String = "yyyy-MM-dd HH:mm:ss"
        return self.string(format: dateFormat)
    }

    func isoDateString() -> String {
        let dateFormat: String = "yyyy-MM-dd"
        return self.string(format: dateFormat)
    }

    func userYMDString() -> String {
        let dateFormat: String = "yyyy/M/d"
        return self.string(format: dateFormat)
    }

    func userYMString() -> String {
        let dateFormat: String = "yyyy/M"
        return self.string(format: dateFormat)
    }

    func userMDString() -> String {
        let dateFormat: String = "M/d"
        return self.string(format: dateFormat)
    }

    func userYMDJPString() -> String {
        let dateFormat: String = "yyyy年M月d日"
        return self.string(format: dateFormat)
    }

    func userYMJPString() -> String {
        let dateFormat: String = "yyyy年M月"
        return self.string(format: dateFormat)
    }

    func userMDJPString() -> String {
        let dateFormat: String = "M月d日"
        return self.string(format: dateFormat)
    }

}
