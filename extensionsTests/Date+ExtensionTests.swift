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
        let date = Date.init(timeIntervalSince1970: 0)
        var expectedString, format: String

        expectedString = "1970/1/1"
        format = "yyyy/M/d"
        XCTAssertEqual(date.string(format: format), expectedString)

        expectedString = "1970/01/01"
        format = "yyyy/MM/dd"
        XCTAssertEqual(date.string(format: format), expectedString)

        expectedString = "1/1"
        format = "M/d"
        XCTAssertEqual(date.string(format: format), expectedString)

        expectedString = "01/01"
        format = "MM/dd"
        XCTAssertEqual(date.string(format: format), expectedString)

        expectedString = "1970/1/1 00:00:00"
        format = "yyyy/M/d HH:mm:ss"
        XCTAssertEqual(date.string(format: format), expectedString)

        expectedString = "1/1 00:00"
        format = "M/d HH:mm"
        XCTAssertEqual(date.string(format: format), expectedString)

        expectedString = "00:00:00"
        format = "HH:mm:ss"
        XCTAssertEqual(date.string(format: format), expectedString)

        expectedString = "0:00"
        format = "H:mm"
        XCTAssertEqual(date.string(format: format), expectedString)
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

}
