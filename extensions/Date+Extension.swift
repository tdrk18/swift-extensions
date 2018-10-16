//
//  Date+Extension.swift
//  extensions
//
//  Created by shota_todoroki on 2018/01/16.
//  Copyright © 2018 shota_todoroki. All rights reserved.
//

import Foundation

extension Date {

    enum DateFormat: String {
        case iso = "yyyy-MM-dd HH:mm:ss"
        case isoDay = "yyyy-MM-dd"
        case ymd = "yyyy/M/d"
        case mdShort = "M/d"
        case dayOfWeek = "E"
        case ymdJP = "yyyy年M月d日"
        case mdJP = "M月d日"
        case time = "HH:mm:ss"

        func locale() -> Locale {
            switch self {
            case .iso, .isoDay:
                return Locale(identifier: "en_US_POSIX")
            case .ymd, .mdShort, .dayOfWeek,
                 .ymdJP, .mdJP, .time:
                return Locale(identifier: "ja_JP")
            }
        }
    }

    static let formatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        if let timezone: TimeZone = TimeZone(identifier: "GMT") {
            formatter.timeZone = timezone
        }
        return formatter
    }()

    static func date(from dateString: String, format: DateFormat) -> Date? {
        let dateFormatter = Date.formatter
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = format.locale()
        return dateFormatter.date(from: dateString)
    }

    static func string(from date: Date, format: DateFormat) -> String {
        let dateFormatter = Date.formatter
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = format.locale()
        return dateFormatter.string(from: date)
    }

    func string(format: DateFormat) -> String {
        return Date.string(from: self, format: format)
    }

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
        return self.string(format: .iso)
    }

    func isoDateString() -> String {
        return self.string(format: .isoDay)
    }

    func userYMDString() -> String {
        return self.string(format: .ymd)
    }

    func userYMString() -> String {
        let dateFormat: String = "yyyy/M"
        return self.string(format: dateFormat)
    }

    func userMDString() -> String {
        return self.string(format: .mdShort)
    }

    func userEString() -> String {
        return self.string(format: .dayOfWeek)
    }

    func userYMDJPString() -> String {
        return self.string(format: .ymdJP)
    }

    func userYMJPString() -> String {
        let dateFormat: String = "yyyy年M月"
        return self.string(format: dateFormat)
    }

    func userMDJPString() -> String {
        return self.string(format: .mdJP)
    }

    func userTimeString() -> String {
        return self.string(format: .time)
    }

}
