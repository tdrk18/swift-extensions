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

}
