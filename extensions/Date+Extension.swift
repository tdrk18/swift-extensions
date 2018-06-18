//
//  Date+Extension.swift
//  extensions
//
//  Created by shota_todoroki on 2018/01/16.
//  Copyright © 2018 shota_todoroki. All rights reserved.
//

import Foundation

public extension Date {

    static let formatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        if let timezone: TimeZone = NSTimeZone.init(abbreviation: "UTC") as TimeZone? {
            formatter.timeZone = timezone
        }
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.calendar = Calendar(identifier: .gregorian)
        return formatter
    }()

    func string(format: String, formatter: DateFormatter = Date.formatter) -> String {
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    init?(dateString: String, dateFormat: String = "") {
        Date.formatter.dateFormat = dateFormat
        guard let date: Date = Date.formatter.date(from: dateString) else { return nil }
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

    func userEString() -> String {
        let dateFormat: String = "E"
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

    func userEJPString() -> String {
        let formatterJP: DateFormatter = DateFormatter()
        if let timezone: TimeZone = NSTimeZone.init(abbreviation: "UTC") as TimeZone? {
            formatterJP.timeZone = timezone
        }
        formatterJP.locale = Locale(identifier: "ja_JP")
        formatterJP.calendar = Calendar(identifier: .gregorian)
        let dateFormat: String = "E"
        return self.string(format: dateFormat, formatter: formatterJP)
    }

    func userTimeString() -> String {
        let dateFormat: String = "HH:mm:ss"
        return self.string(format: dateFormat)
    }

    func userTimeHMString() -> String {
        let dateFormat: String = "HH:mm"
        return self.string(format: dateFormat)
    }

}
