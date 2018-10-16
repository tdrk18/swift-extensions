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

    func testInit() {
        var dateString, dateFormat: String
        var date: Date?

        dateString = "1970/01/01"
        dateFormat = "yyyy/MM/dd"
        date = Date.init(dateString: dateString, dateFormat: dateFormat)
        XCTAssertEqual(date, Date.init(timeIntervalSince1970: 0))

        dateString = "1970/01/01"
        dateFormat = "MM/dd"
        date = Date.init(dateString: dateString, dateFormat: dateFormat)
        XCTAssertNil(date)
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

}
