//
//  Date+ExtensionTests.swift
//  extensionsTests
//
//  Created by shota_todoroki on 2018/01/16.
//  Copyright © 2018 shota_todoroki. All rights reserved.
//

import XCTest

@testable import extensions

class DateExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testString() {
        let date: Date = Date.init(timeIntervalSince1970: 0)
        var expectedString: String

        expectedString = "1970-01-01 00:00:00"
        XCTAssertEqual(date.string(format: .iso), expectedString)

        expectedString = "1970/1/1"
        XCTAssertEqual(date.string(format: .ymd), expectedString)

        expectedString = "1/1"
        XCTAssertEqual(date.string(format: .mdShort), expectedString)

        expectedString = "00:00:00"
        XCTAssertEqual(date.string(format: .time), expectedString)
    }

    func testDate() {
        var dateString: String
        var date: Date?

        dateString = "1970-01-01 00:00:00"
        date = Date.date(from: dateString, format: .iso)
        XCTAssertEqual(date, Date.init(timeIntervalSince1970: 0))

        dateString = "1970/01/01"
        date = Date.date(from: dateString, format: .ymd)
        XCTAssertEqual(date, Date.init(timeIntervalSince1970: 0))
    }

    func testInit() {
        var dateString: String
        var date: Date?

        dateString = "1970-01-01 00:00:00"
        date = Date.init(from: dateString, format: .iso)
        XCTAssertEqual(date, Date.init(timeIntervalSince1970: 0))

        dateString = "1970/01/01"
        date = Date.init(from: dateString, format: .ymd)
        XCTAssertEqual(date, Date.init(timeIntervalSince1970: 0))
    }

    func testISOString() {
        var date: Date
        var expectedString: String

        date = Date.init(timeIntervalSince1970: 0)
        expectedString = "1970-01-01 00:00:00"
        XCTAssertEqual(date.isoString(), expectedString)

        date = Date.init(timeIntervalSince1970: 1000000)
        expectedString = "1970-01-12 13:46:40"
        XCTAssertEqual(date.isoString(), expectedString)
    }

    func testISODateString() {
        var date: Date
        var expectedString: String

        date = Date.init(timeIntervalSince1970: 0)
        expectedString = "1970-01-01"
        XCTAssertEqual(date.isoDateString(), expectedString)

        date = Date.init(timeIntervalSince1970: 1000000)
        expectedString = "1970-01-12"
        XCTAssertEqual(date.isoDateString(), expectedString)
    }

    func testUserYMDString() {
        var date: Date
        var expectedString: String

        date = Date.init(timeIntervalSince1970: 0)
        expectedString = "1970/1/1"
        XCTAssertEqual(date.userYMDString(), expectedString)

        expectedString = "1970/1/12"
        date = Date.init(timeIntervalSince1970: 1000000)
        XCTAssertEqual(date.userYMDString(), expectedString)
    }

    func testUserMDString() {
        var date: Date
        var expectedString: String

        date = Date.init(timeIntervalSince1970: 0)
        expectedString = "1/1"
        XCTAssertEqual(date.userMDString(), expectedString)

        expectedString = "1/12"
        date = Date.init(timeIntervalSince1970: 1000000)
        XCTAssertEqual(date.userMDString(), expectedString)
    }

    func testUserEString() {
        var date: Date
        var expectedString: String

        date = Date.init(timeIntervalSince1970: 0)
        expectedString = "木"
        XCTAssertEqual(date.userEString(), expectedString)

        expectedString = "月"
        date = Date.init(timeIntervalSince1970: 1000000)
        XCTAssertEqual(date.userEString(), expectedString)
    }

    func testUserYMDJPString() {
        var date: Date
        var expectedString: String

        date = Date.init(timeIntervalSince1970: 0)
        expectedString = "1970年1月1日"
        XCTAssertEqual(date.userYMDJPString(), expectedString)

        date = Date.init(timeIntervalSince1970: 1000000)
        expectedString = "1970年1月12日"
        XCTAssertEqual(date.userYMDJPString(), expectedString)
    }

    func testUserMDJPString() {
        var date: Date
        var expectedString: String

        date = Date.init(timeIntervalSince1970: 0)
        expectedString = "1月1日"
        XCTAssertEqual(date.userMDJPString(), expectedString)

        date = Date.init(timeIntervalSince1970: 1000000)
        expectedString = "1月12日"
        XCTAssertEqual(date.userMDJPString(), expectedString)
    }

    func testUserTimeString() {
        var date: Date
        var expectedString: String

        date = Date.init(timeIntervalSince1970: 0)
        expectedString = "00:00:00"
        XCTAssertEqual(date.userTimeString(), expectedString)

        date = Date.init(timeIntervalSince1970: 1000000)
        expectedString = "13:46:40"
        XCTAssertEqual(date.userTimeString(), expectedString)
    }

    func testAddHours() {
        guard let date = Date.init(from: "2000-01-01 00:00:00", format: .iso) else {
            XCTFail("failed create date object")
            return
        }

        var add: Int

        add = 5
        guard let expect1 = Date.init(from: "2000-01-01 05:00:00", format: .iso) else {
            XCTFail("failed create date object")
            return
        }
        XCTAssertEqual(date.add(hours: add), expect1)

        add = 20
        guard let expect2 = Date.init(from: "2000-01-01 20:00:00", format: .iso) else {
            XCTFail("failed create date object")
            return
        }
        XCTAssertEqual(date.add(hours: add), expect2)

        add = -10
        guard let expect3 = Date.init(from: "1999-12-31 14:00:00", format: .iso) else {
            XCTFail("failed create date object")
            return
        }
        XCTAssertEqual(date.add(hours: add), expect3)
    }

    func testStartOfDay() {
        guard let date1 = Date.init(from: "2000-01-01 00:00:00", format: .iso),
              let expect1 = Date.init(from: "2000-01-01", format: .isoDay) else {
            XCTFail("failed create date object")
            return
        }
        XCTAssertEqual(date1.startOfDay(), expect1)

        guard let date2 = Date.init(from: "2000-01-01 23:30:00", format: .iso),
              let expect2 = Date.init(from: "2000-01-01", format: .isoDay) else {
            XCTFail("failed create date object")
            return
        }
        XCTAssertEqual(date2.startOfDay(), expect2)
    }

    func testEndOfDay() {
        guard let date1 = Date.init(from: "2000-01-01 00:00:00", format: .iso),
              let expect1 = Date.init(from: "2000-01-01 23:59:59", format: .iso) else {
            XCTFail("failed create date object")
            return
        }
        XCTAssertEqual(date1.endOfDay(), expect1)

        guard let date2 = Date.init(from: "2000-01-01 23:30:00", format: .iso),
              let expect2 = Date.init(from: "2000-01-01 23:59:59", format: .iso) else {
            XCTFail("failed create date object")
            return
        }
        XCTAssertEqual(date2.endOfDay(), expect2)
    }

    func testStartOfWeek() {
        guard let date1 = Date.init(from: "2000-01-01 00:00:00", format: .iso),
              let expect1 = Date.init(from: "1999-12-27 00:00:00", format: .iso) else {
            XCTFail("failed create date object")
            return
        }
        XCTAssertEqual(date1.startOfWeek(), expect1)

        guard let date2 = Date.init(from: "2018-10-18 00:00:00", format: .iso),
              let expect2 = Date.init(from: "2018-10-15 00:00:00", format: .iso) else {
            XCTFail("failed create date object")
            return
        }
        XCTAssertEqual(date2.startOfWeek(), expect2)
    }

    func testEndOfWeek() {
        guard let date1 = Date.init(from: "2000-01-01 00:00:00", format: .iso),
              let expect1 = Date.init(from: "2000-01-02 00:00:00", format: .iso) else {
            XCTFail("failed create date object")
            return
        }
        XCTAssertEqual(date1.endOfWeek(), expect1)

        guard let date2 = Date.init(from: "2018-10-18 00:00:00", format: .iso),
              let expect2 = Date.init(from: "2018-10-21 00:00:00", format: .iso) else {
            XCTFail("failed create date object")
            return
        }
        XCTAssertEqual(date2.endOfWeek(), expect2)
    }

    func testIsBefore() {
        guard let date1 = Date.init(from: "2000-01-01 00:00:00", format: .iso),
              let date2 = Date.init(from: "2000-01-02 12:34:56", format: .iso) else {
            XCTFail("failed create date object")
            return
        }
        XCTAssertTrue(date1.isBefore(date2))
        XCTAssertFalse(date2.isBefore(date1))
        XCTAssertFalse(date1.isBefore(date1))
    }

    func testIsAfter() {
        guard let date1 = Date.init(from: "2000-01-01 00:00:00", format: .iso),
              let date2 = Date.init(from: "2000-01-02 12:34:56", format: .iso) else {
            XCTFail("failed create date object")
            return
        }
        XCTAssertFalse(date1.isAfter(date2))
        XCTAssertTrue(date2.isAfter(date1))
        XCTAssertFalse(date1.isAfter(date1))
    }

    func testIsFuture() {
        guard let date = Date.init(from: "2000-01-01 00:00:00", format: .iso) else {
            XCTFail("failed create date object")
            return
        }
        XCTAssertFalse(date.isFuture())

        let future = Date.init(timeIntervalSinceNow: 60 * 60 * 10)
        XCTAssertTrue(future.isFuture())
    }

}
