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

        func locale() -> Locale {
            switch self {
            case .iso, .isoDay:
                return Locale(identifier: "en_US_POSIX")
            case .ymd, .mdShort, .dayOfWeek,
                 .ymdJP, .mdJP:
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
