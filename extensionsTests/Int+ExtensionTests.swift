//
//  Int+ExtensionTests.swift
//  extensionsTests
//
//  Created by shota_todoroki on 2018/01/08.
//  Copyright © 2018 shota_todoroki. All rights reserved.
//

import XCTest

@testable import extensions

class IntExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testIsEven() {
        XCTAssertTrue(2.isEven)
        XCTAssertFalse(3.isEven)
        XCTAssertTrue(102.isEven)
        XCTAssertFalse(12345.isEven)
    }

    func testFormattedStringWithComma() {
        var num: Int
        var str: String

        num = 10
        str = "10"
        XCTAssertEqual(num.formattedStringWithComma, str)

        num = 1000
        str = "1,000"
        XCTAssertEqual(num.formattedStringWithComma, str)

        num = 56789
        str = "56,789"
        XCTAssertEqual(num.formattedStringWithComma, str)

        num = 123456789
        str = "123,456,789"
        XCTAssertEqual(num.formattedStringWithComma, str)
    }

}
