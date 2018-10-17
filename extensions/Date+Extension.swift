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

    static let iso8601Calendar: Calendar = {
        var calendar = Calendar(identifier: .iso8601)
        if let timeZone = TimeZone(identifier: "GMT") {
            calendar.timeZone = timeZone
        }
        return calendar
    }()

    static let gregorianCalendar: Calendar = {
        var calendar = Calendar(identifier: .gregorian)
        if let timeZone = TimeZone(identifier: "GMT") {
            calendar.timeZone = timeZone
        }
        return calendar
    }()

    init?(from dateString: String, format: DateFormat) {
        guard let date = Date.date(from: dateString, format: format) else { return nil }
        self = date
    }

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

    func isoString() -> String {
        return self.string(format: .iso)
    }

    func isoDateString() -> String {
        return self.string(format: .isoDay)
    }

    func userYMDString() -> String {
        return self.string(format: .ymd)
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

    func userMDJPString() -> String {
        return self.string(format: .mdJP)
    }

    func userTimeString() -> String {
        return self.string(format: .time)
    }

    func startOfDay() -> Date {
        return Date.gregorianCalendar.startOfDay(for: self)
    }

    func endOfDay() -> Date? {
        var dateComponents = DateComponents()
        dateComponents.hour = 23
        dateComponents.minute = 59
        dateComponents.second = 59

        return Date.gregorianCalendar.date(byAdding: dateComponents, to: self.startOfDay())
    }

    func startOfWeek() -> Date? {
        let calendar = Date.iso8601Calendar
        let components = calendar.dateComponents(
            [.weekOfYear, .yearForWeekOfYear],
            from: self
        )
        return calendar.date(from: components)
    }

    func isBefore(_ date: Date) -> Bool {
        return self.compare(date) == .orderedAscending
    }

    func isAfter(_ date: Date) -> Bool {
        return self.compare(date) == .orderedDescending
    }

    func isFuture() -> Bool {
        return Date().isBefore(self)
    }

}
